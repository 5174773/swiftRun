//
//  HTTPTool.swift
//  kkp
//
//  Created by Lo on 2018/6/23.
//  Copyright © 2018年 Lo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import KeychainSwift
class HTTPTool: NSObject {
    static let defult = HTTPTool()
    
    private override init() {
//        KeychainSwift.
        // 单例模式，防止出现多个实例
    }
    
    func getRequestWithURL(path :String,parameter:[String: AnyObject]?, success: @escaping (_ result: JSON) -> Void ,failure: @escaping (_ error: Error) -> Void ) -> Void {
        Alamofire.request(path, method: .get, parameters: parameter, encoding: JSONEncoding.default).responseJSON { response in

            switch response.result {
            case .success(let value):
                let json = JSON(value)
                 success(json)
                print("JSON: \(json)")
            case .failure(let error):
                 print(error)
                 failure(error)
            }
            
            return
        }
    }
    
    func postRequestWithURL(path :String,parameter:[String: AnyObject]?, complection: @escaping (_ result: JSON) -> Void,failure: @escaping (_ error: Error) -> Void  ) -> Void {
        Alamofire.request(path, method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                complection(json)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
                failure(error)
            }
            
            return
        }
    }
    
    
    // delete、put 请求自己添加
}
