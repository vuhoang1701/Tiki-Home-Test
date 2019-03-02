//
//  HotTrendTableViewCell.swift
//  TikiHomeTest
//
//  Created by HoangVu on 3/2/19.
//  Copyright © 2019 HoangVu. All rights reserved.
//

import UIKit

class HotTrendTableViewCell: UITableViewCell {

    static var CELL_IDENTIFIER: String { return "HotTrendTableViewCell" }
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HotTrendTableViewCell
{
        //Set delefate of Colection view in cell with Root view 
        func setDelegateOfColectionViewWithSelectedView<Delegate: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: Delegate, forRow row: Int) {
            collectionView.delegate = dataSourceDelegate
            collectionView.dataSource = dataSourceDelegate
            collectionView.reloadData()
        }

}
