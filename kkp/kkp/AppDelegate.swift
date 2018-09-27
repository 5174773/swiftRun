//
//  AppDelegate.swift
//  kkp
//
//  Created by Lo on 2018/6/20.
//  Copyright © 2018年 Lo. All rights reserved.
//

import UIKit
import KeychainSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let screenSize: CGRect = UIScreen.main.bounds;
        Display.initilize(width: screenSize.width, height: screenSize.height)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        let keychain = KeychainSwift();
        var solecode = "";
        if(keychain.get("solecode")==nil){
            let now = NSDate()
            let timeInterval:TimeInterval = now.timeIntervalSince1970
            let timeStamp = String(timeInterval)
            let startSlicingIndex = timeStamp.index(timeStamp.startIndex, offsetBy: 5)
            let subvalues = timeStamp[startSlicingIndex...]
            let uuid = UUID().uuidString
            solecode = uuid + subvalues
            solecode += String(arc4random())
            keychain.set(solecode, forKey: solecode)
        }else{
            solecode = keychain.get("solecode")!
        }
        print(solecode)
        var param = [String : AnyObject]()
        param["solecode"] = solecode as AnyObject
        var paramsa = [String:AnyObject]()
        paramsa["country_code"] = "86" as AnyObject
        paramsa["phone"] = "15618397991" as AnyObject
        paramsa["nickname"] = "sdssdsd" as AnyObject
        paramsa["birth"] = 19200121 as AnyObject
        paramsa["sex"] = 1 as AnyObject
        paramsa["solecode"] = solecode as AnyObject

        
        HTTPTool<RegMobile>().postRequestWithURL(path: ConstAPI.REG_MOBILE, parameter: paramsa, success: {
            (model) in
            
        }) { (error) in
            print(error)
        }
    
    return false
    }
}

