//
//  BeginSearchViewController.swift
//  TikiHomeTest
//
//  Created by HoangVu on 3/1/19.
//  Copyright © 2019 HoangVu. All rights reserved.
//

import UIKit
import SnapKit

class BeginSearchViewController: UIViewController
{
  
    var arrTrendItems: [TrendItemInfo] = []
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        loadData()
    
    }
    
    //Load trending keywords from proviedURL
    func loadData()
    {
        NetworkManager.getTrendingList(stringURL: "https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json", success: { (arrayData) in
            self.arrTrendItems = []
            for item in arrayData
            {
                if let name = item["keyword"], let imageUrl = item["icon"]
                {
                    let trendItem = TrendItemInfo(itemName: name, itemImageUrl: imageUrl)
                    self.arrTrendItems.append(trendItem)
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.tableView.reloadData()
            }
            
            
        }) { (error) in
            fatalError("Request error. Detail: \(error.userInfo)")
        }
    }
    
    //Calculate size of label content base on length of string
    static func caculateContentWidthForLabel(string: String, height: Float, font: UIFont) -> CGSize
    {
        let width = string.width(withConstrainedHeight: TrendItemCollectionViewCell.HEIGHT_OF_LABEL, font:font, minimumTextWrapWidth: 20)
        if(width <= ( TrendItemCollectionViewCell.DEFAULT_SIZE.width - TrendItemCollectionViewCell.LABEL_PADDING))
        {
            return TrendItemCollectionViewCell.DEFAULT_SIZE
        }
        else
        {
            return CGSize(width:width + 32, height: TrendItemCollectionViewCell.DEFAULT_SIZE.height)
            
        }
    }
}



//Extension handle for Delegate and DataSource of TableView
extension BeginSearchViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HotTrendTableViewCell.CELL_IDENTIFIER, for: indexPath) as! HotTrendTableViewCell
        cell.selectionStyle = .none;
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        //Set up for hearder View
        headerView.backgroundColor = UIColor.white
        let headerTitle = UILabel()
        headerTitle.font = UIFont.systemFont(ofSize: 15)
        headerTitle.textColor = UIColor.black
        headerTitle.text = "Từ Khóa Hot"
        headerTitle.sizeToFit()
        headerView.addSubview(headerTitle)
        headerTitle.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(headerView).offset(0)
            make.bottom.equalTo(headerView).offset(0)
            make.left.equalTo(headerView).offset(15)
            make.right.equalTo(headerView).offset(8)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? HotTrendTableViewCell
        else { return }
        
        //Set delefate of Colection view in cell with Root view
        tableViewCell.setDelegateOfColectionViewWithSelectedView(self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}


//Extension handle for Delegate and DataSource of custom cell's collectionView
extension BeginSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTrendItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendItemCollectionViewCell.CELL_IDENTIFIER, for: indexPath) as! TrendItemCollectionViewCell
        cell.setBackgroundColorBaseOnIndex(index: indexPath.row)
        cell.titleLbl.text = arrTrendItems[indexPath.row].itemName
        cell.itemImageView.downloaded(from: arrTrendItems[indexPath.row].itemImageUrl!, contentMode: .scaleAspectFit)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        
        //Resize collection item to dynamic width
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let stringOfText = arrTrendItems[indexPath.row].itemName
        return BeginSearchViewController.caculateContentWidthForLabel(string: stringOfText, height: Float(TrendItemCollectionViewCell.HEIGHT_OF_LABEL), font: UIFont.systemFont(ofSize: 14))
       
    }
    
}


