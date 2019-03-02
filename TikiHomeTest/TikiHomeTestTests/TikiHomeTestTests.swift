//
//  TikiHomeTestTests.swift
//  TikiHomeTestTests
//
//  Created by HoangVu on 3/1/19.
//  Copyright © 2019 HoangVu. All rights reserved.
//

import XCTest
@testable import TikiHomeTest

class TikiHomeTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidCodeReturnWhenLoadListTrending()
    {
        
        let url =  "https://tiki-mobile.s3-ap-southeast-1.amazonaws.com/ios/keywords.json"
        
        let promise = expectation(description: "Status code: 200")
        
        NetworkManager.getTrendingList(stringURL: url
            , success: { (returnData) in
                promise.fulfill()
        }) { (error) in
            XCTFail("Error: \(error.localizedDescription)")
            return
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testCalculateShortStringReturnAndWidthLessThanDefaulSize()
    {
        let stringToTest = "iPhone"
        let defaultHeight = 44
        let defaultFont = UIFont.systemFont(ofSize: 14)
        
        let calculatedSize = BeginSearchViewController.caculateContentWidthForLabel(string: stringToTest, height: Float(defaultHeight), font: defaultFont)
        XCTAssert(calculatedSize == TrendItemCollectionViewCell.DEFAULT_SIZE, "Should return default size of trending item")
    }
    
    func testCalculateEmptyStringAndWidthEqualDefaultSize()
    {
        let stringToTest = ""
        let defaultHeight = 44
        let defaultFont = UIFont.systemFont(ofSize: 14)
        
        let calculatedSize = BeginSearchViewController.caculateContentWidthForLabel(string: stringToTest, height: Float(defaultHeight), font: defaultFont)
        XCTAssert(calculatedSize == TrendItemCollectionViewCell.DEFAULT_SIZE, "Should return default size of trending item")
    }
    
    func testCalculateStringCanBreakIntoTwoLinesAndWidthLessThanDefaultWidth()
    {
        let stringToTest = "Vé máy bay giá"
        let defaultHeight = 44
        let defaultFont = UIFont.systemFont(ofSize: 14)
        
        let calculatedSizeWithOneLine = BeginSearchViewController.caculateContentWidthForLabel(string: stringToTest, height: Float(defaultHeight/2), font: defaultFont)
        XCTAssert(calculatedSizeWithOneLine.width >= TrendItemCollectionViewCell.DEFAULT_SIZE.width, "Title is too long and enough to break into two lines")
        
        let calculatedSizeWithTwoLine = BeginSearchViewController.caculateContentWidthForLabel(string: stringToTest, height: Float(defaultHeight), font: defaultFont)
        XCTAssert(calculatedSizeWithTwoLine.width == TrendItemCollectionViewCell.DEFAULT_SIZE.width, "Title is long than one lines and enough to break into two lines but still less then defaut size")
    }
    
    func testCalculateLongStringCanBearkIntoTwoLinesAndWidthGreaterThanDefaultWidth()
    {
        let stringToTest = "Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ"
        let defaultHeight = 44
        let defaultFont = UIFont.systemFont(ofSize: 14)
        
        
        let calculatedSizeWithTwoLineHasLongText = BeginSearchViewController.caculateContentWidthForLabel(string: stringToTest, height: Float(defaultHeight), font: defaultFont)
        XCTAssert(calculatedSizeWithTwoLineHasLongText.width >= TrendItemCollectionViewCell.DEFAULT_SIZE.width, "Title is long and can break into into two lines and expend the width of the cell")
    }
    
    func testCalculateVeryLongStringCanBearkIntoTwoLinesAndWidthGreaterThanDefaultWidth()
    {
        let stringToTest = "Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ v v Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ Vé máy bay giá rẻ số lượng có hạn. Mua ngay kẻo lỡ"
        let defaultHeight = 44
        let defaultFont = UIFont.systemFont(ofSize: 14)
        
        
        let calculatedSizeWithTwoLineHasLongText = BeginSearchViewController.caculateContentWidthForLabel(string: stringToTest, height: Float(defaultHeight), font: defaultFont)
        XCTAssert(calculatedSizeWithTwoLineHasLongText.width >= TrendItemCollectionViewCell.DEFAULT_SIZE.width, "String is very long and can break into two lines and expend the width of the cell")
    }
    
    
}

