//
//  MyKeyChainManager.swift
//  kkp
//
//  Created by Lo on 2018/6/23.
//  Copyright © 2018年 Lo. All rights reserved.
//

import Foundation


class MyKeyChainManager {
    
    static let _SingLetonKeyChainManager = MyKeyChainManager()

    
    //单例模式
    class var sharedInstance: MyKeyChainManager{
        return _SingLetonKeyChainManager
    }
    
    private init() {
        
    }
    
    //根据不同的service获取不同的Value
    func getKeyChainItemDictionary(service: String) -> NSMutableDictionary{
        var mDictionary = NSMutableDictionary()
        
        mDictionary.setObject(kSecClassInternetPassword as NSString, forKey: kSecClass as NSString)
        mDictionary.setObject(service, forKey:  kSecAttrServer as NSString)
        mDictionary.setObject("nodefine", forKey: kSecAttrAccount as NSString)
        
        return mDictionary
    }
    
    func add(service: String, data: AnyObject) -> OSStatus{
        var mDictionary = getKeyChainItemDictionary(service: service)
        var status: OSStatus = noErr
        
        let result = get(service: service)
        
        if result.0 != nil{
            let dic = result.1
            let createTime = dic?.object(forKey: "cdat") as! NSDate
            let modifyTime = dic?.object(forKey: "mdat") as! NSDate
            status = update(service: service, data: data)
        } else {
        mDictionary.setObject(NSKeyedArchiver.archivedDataWithRootObject(data), forKey: kSecValueData)
            status = SecItemAdd(mDictionary, nil)
        }
        
        return status
    }
    
    func delete(service: String) -> OSStatus{
        var mDictionary = getKeyChainItemDictionary(service: service)
        var status: OSStatus
        
        let result = get(service: service)
        
        if result.0 != nil{
            let dic = result.1
            let createTime = dic?.object(forKey: "cdat") as! NSDate
            let modifyTime = dic?.object(forKey: "mdat") as! NSDate
          
            status = SecItemDelete(mDictionary)
        } else{
            status = noErr
        }
        
        return status
    }
    
    func update(service: String, data: AnyObject) -> OSStatus{
        var mDictionary = getKeyChainItemDictionary(service: service)
        var status: OSStatus = noErr
        
        let result = get(service: service)
        
        if result.0 != nil{
            let dic = result.1
            let createTime = dic?.object(forKey: "cdat") as! NSDate
            let modifyTime = dic?.object(forKey: "mdat") as! NSDate
        
            
            var updateDictionary = NSMutableDictionary()
            updateDictionary.setObject(NSKeyedArchiver.archivedDataWithRootObject(data), forKey: kSecValueData as String)
            
            var status = SecItemUpdate(mDictionary,updateDictionary)
        } else {
            status = add(service: service, data: data)
        }
        
        return status
    }
    
    func get(service: String) -> (AnyObject?, NSDictionary?){
        var mDictionary = getKeyChainItemDictionary(service: service)
        mDictionary.setObject(kCFBooleanTrue, forKey: kSecReturnData)
        mDictionary.setObject(kCFBooleanTrue, forKey: kSecReturnAttributes as String)
        
        var queryResult: Unmanaged<AnyObject>?
        
        let status = SecItemCopyMatching(mDictionary,queryResult)
        
        let opaque = queryResult?.toOpaque()
        
        var contentsOfKeychain: NSString?
        
        var finallyData: AnyObject?
        var returnDic: NSDictionary?
        if let op = opaque {
            returnDic = Unmanaged<NSDictionary>.fromOpaque(op).takeUnretainedValue()
            let valueData = returnDic!.object(forKey: kSecValueData) as! NSData
            finallyData = NSKeyedUnarchiver.unarchiveObjectWithData(valueData as Data)
        }
        
        
        return (finallyData, returnDic)
    }
    
    
}  
