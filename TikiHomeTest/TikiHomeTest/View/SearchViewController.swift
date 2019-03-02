//
//  ViewController.swift
//  TikiHomeTest
//
//  Created by HoangVu on 3/1/19.
//  Copyright © 2019 HoangVu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    var searchController: UISearchController!
    var beginSearchController: BeginSearchViewController!
    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    
    @IBOutlet weak var rightBarBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        addSearchBar()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func addSearchBar()
    {
        //Set up Seach Controller
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.sizeToFit()
        navigationItem.titleView = searchController?.searchBar
        searchController.searchBar.setShowsCancelButton(false, animated: false)
        searchController.searchBar.tintColor = UIColor.white
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false;
        searchController.searchBar.delegate = self
        searchController.delegate = self

        //Set place holder
        for subview in searchController.searchBar.subviews
        {
             for textInput in subview.subviews
             {
                if textInput is UITextField
                {
                    let textInput = textInput as! UITextField
                    textInput.placeholder = "Sản phẩm, thương hiệu và mọi thứ"
                    
                }
            }
          
        }
        
    }
    
    func showRightButtons()
    {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Cart"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
 
    
    }
    
    func hideRightButtons()
    {
        navigationItem.rightBarButtonItem = nil;
    }
    
    
    
    func showBeginSearchViewController()
    {
        if(beginSearchController == nil)
        {
            //Initial for BeginVC
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let beginSearchVC = storyboard.instantiateViewController(withIdentifier: "beginSearch")
            beginSearchVC.willMove(toParent: self)
            view.addSubview(beginSearchVC.view)
            
            //Constraint for beginSearch view
            beginSearchVC.view.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(view).offset(0)
                make.bottom.equalTo(view).offset(0)
                make.left.equalTo(view).offset(0)
                make.right.equalTo(view).offset(0)
            }
            
            addChild(beginSearchVC)
            beginSearchVC.view.alpha = 0;
            beginSearchVC.didMove(toParent: self)
            view.bringSubviewToFront(beginSearchVC.view)
            beginSearchController = beginSearchVC as? BeginSearchViewController;
 
        }
        else
        {
            beginSearchController.loadData()
        }
        beginSearchController.view.isHidden = false;
        UIView.animate(withDuration: 0.3) {
            self.beginSearchController.view.alpha = 1
        }
    }
    
    func hideBeginSearchController()
    {

        UIView.animate(withDuration: 0.3) {
            self.beginSearchController.view.alpha = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.beginSearchController.view.isHidden = true;
        }

    }
    
    // MARK: - UISearchController Delegate
    func didDismissSearchController(_ searchController: UISearchController) {
          showRightButtons()
    }



    // MARK: - UISearchBar Delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //hide barbutton
        hideRightButtons()
        
        //Show begin search view
        showBeginSearchViewController()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        //Hide beginSearchView
        hideBeginSearchController()
    }


    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        
        //Search and filtering data here
        print("User is inputting")
    }
    
    
    
}



