//
//  MyUUIDManager.swift
//  kkp
//
//  Created by Lo on 2018/6/23.
//  Copyright © 2018年 Lo. All rights reserved.
//

import Foundation

class MyUUIDManager {
    
    private let kKeyChainUUIDIdentifier = "com.myuuid.uuid";
    
    private let keychainManager = MyKeyChainManager.sharedInstance
    
    private func getOriginUUID() -> String {
        var puuid = CFUUIDCreate( nil );
        
        var uuidString = CFUUIDCreateString(nil, puuid);
        
        return uuidString as String
    }
    
    private func addUUID() -> (OSStatus, String) {
        
        let uuidString = getOriginUUID()
        var status: OSStatus = noErr
        
        status = keychainManager.add(service: kKeyChainUUIDIdentifier, data: uuidString)
        
        return (status, uuidString)
    }
    
    func deleteUUID() -> OSStatus {
        return keychainManager.delete(service: kKeyChainUUIDIdentifier)
    }
    
    func updateUUID(newUUID: String) -> OSStatus {
        return keychainManager.update(service: kKeyChainUUIDIdentifier, data: newUUID)
    }
    
    func getUUID() -> String? {
        
        let getData: AnyObject? = keychainManager.get(kKeyChainUUIDIdentifier).0
        var uuidString: String?
        if let data: AnyObject = getData {
            uuidString = data as? String
        } else {
            let result = addUUID()
            println("Keychain 的UUID不存在，首次保存。")
            if result.0 == noErr {
                uuidString = result.1
            }
        }
        
        
        return uuidString
    }
    
}  
