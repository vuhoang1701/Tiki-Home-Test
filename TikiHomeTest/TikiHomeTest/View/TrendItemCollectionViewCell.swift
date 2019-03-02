//
//  TrendItemCollectionViewCell.swift
//  TikiHomeTest
//
//  Created by HoangVu on 3/2/19.
//  Copyright © 2019 HoangVu. All rights reserved.
//

import UIKit

class TrendItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    static var CELL_IDENTIFIER: String { return "TrendItemCollectionViewCell"}
    static let DEFAULT_SIZE = CGSize(width: 112, height: 190)
    static let LABEL_PADDING  : CGFloat = 16
    static let HEIGHT_OF_LABEL: CGFloat = 44
    
    func setBackgroundColorBaseOnIndex(index: Int)
    {
        let result = index%9
        switch result {
        case 0:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#16702e")
            break
        case 1:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#005a51")
            break
        case 2:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#996c00")
            break
        case 3:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#5c0a6b")
            break
        case 4:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#006d90")
            break
        case 5:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#974e06")
            break
        case 6:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#99272e")
            break
        case 7:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#89221f")
            break
        case 8:
            titleView.backgroundColor = UIColor.colorWithHexString(hexString: "#00345d")
            break
      
        default:
            break
        }
    }
}

