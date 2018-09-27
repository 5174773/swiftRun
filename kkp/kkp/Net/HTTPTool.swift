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
import ObjectMapper
class HTTPTool<T:Mappable>: NSObject {
    public override init() {
        //        KeychainSwift.
        // 单例模式，防止出现多个实例
    }
    

    
    func getRequestWithURL(path :String,parameter:[String: AnyObject]?, success: @escaping (_ result: T) -> Void ,failure: @escaping (_ error: Error) -> Void ) -> Void {
        
        
        Alamofire.request(ConstAPI.BASE_URL+path, method: .get, parameters: parameter, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let result = Mapper<Result<T>>().map(JSON:value as! [String : Any])?.result
                success(result!)
                
            case .failure(let error):
                print(error)
                failure(error)
            }
            
            return
        }
    }
    
    func postRequestWithURL(path :String,parameter:[String: AnyObject]?, success: @escaping (_ result: T) -> Void ,failure: @escaping (_ error: Error) -> Void ) -> Void {
        Alamofire.request(ConstAPI.BASE_URL+path, method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let result = Mapper<Result<T>>().map(JSON:value as! [String : Any])?.result
                success(result!)
                
            case .failure(let error):
                print(error)
                failure(error)
            }
            
            return
        }
    }
    
    
    // delete、put 请求自己添加
}
