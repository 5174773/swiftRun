//
//  AppDelegate.swift
//  kkp
//
//  Created by Lo on 2018/6/20.
//  Copyright © 2018年 Lo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let screenSize: CGRect = UIScreen.main.bounds;
        Display.instance.initilize(width: screenSize.width, height: screenSize.height)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        
        
        
        return true
    }


}

