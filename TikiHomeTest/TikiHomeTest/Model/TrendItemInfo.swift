//
//  TrendItemInfo.swift
//  TikiHomeTest
//
//  Created by HoangVu on 3/2/19.
//  Copyright © 2019 HoangVu. All rights reserved.
//

import UIKit

class TrendItemInfo {
    
    var itemName: String
    var itemImageUrl: String?
    
    init(itemName: String, itemImageUrl: String? = nil) {
        self.itemName = itemName
        self.itemImageUrl = itemImageUrl
    }

}
