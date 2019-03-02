//
//  NetworkManager.swift
//  TikiHomeTest
//
//  Created by HoangVu on 3/2/19.
//  Copyright © 2019 HoangVu. All rights reserved.
//

import UIKit
import Alamofire
class NetworkManager {
    
    
    private static let sessionManager = Alamofire.SessionManager()
    private static let queue = DispatchQueue(label: "HoangVu.TikiHomeTest" + UUID().uuidString)
    
    static func getTrendingList(stringURL: String, success: @escaping (_ arrayTrendItems: [[String:String]]) -> Void, failure: @escaping (_ error: NSError) -> Void) {
        
        
        self.request(stringURL, method: .get, parameters: nil, success: { (jsonData) in
            if let jsonDictionary = jsonData as? [NSObject : Any] as NSDictionary?,
                let arrayTrendItems = jsonDictionary["keywords"] as? [[String : String]]
            {
                success(arrayTrendItems)
            }
            else
            {
                failure(NSError(domain: "Data is not valid", code: 404, userInfo: nil))
                    
            }
        }) { (error) in
            failure(error)
        }
    }
    
    
    private static func request(_ stringURL: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, success: @escaping (_ returnData: Any) -> Void, failure: @escaping (_ error: NSError) -> Void)
    {
        let headers = ["Content-Type": "application/json"]

        let completion: (DataResponse<Any>) -> Void = { (response) -> Void in
            
            if(response.result.isSuccess)
            {
                if let value = response.result.value
                {
                    success(value)
                }
                
            }
            else if (response.result.isFailure)
            {
                if let value = response.error
                {
                    failure(value as NSError)
                }
            }
    
        }
        
        self.sessionManager.request(stringURL, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).validate().responseJSON(queue: queue, completionHandler: completion)
    }

}
