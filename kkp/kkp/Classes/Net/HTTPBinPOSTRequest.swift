//
//  HTTPBinPOSTRequest.swift
//  kkp
//
//  Created by Lo on 2018/6/23.
//  Copyright © 2018年 Lo. All rights reserved.
//

//Mark: - POST
import SolarNetwork


//Mark: - GET
class HTTPBinGETRequest: SLRequest {
    
    override func loadRequest() {
        super.loadRequest()
        
        self.path = "/get"
    }
    
}

HTTPBinNetwork.request(HTTPBinGETRequest()) { (response) in
    if let dictionary = response.dataDictionary {
        
    }
    else if let error = response.error {
        //show error
    }
}
class HTTPBinPOSTRequest: SLRequest {
    
    override func loadRequest() {
        super.loadRequest()
        
        self.method = .post
        self.path = "/post"
    }
    
    /**
     利用反射，将属性自动转换为Parameters，不需要自己组装了
     ["userName": "myUserName",
     "password": "myPassword"]
     */
    let userName = "myUserName"
    let password = "myPassword"
    
}

HTTPBinNetwork.request(HTTPBinPOSTRequest()) { (response) in
    if let dictionary = response.dataDictionary {
        
    }
    else if let error = response.error {
        //show error
    }
}
