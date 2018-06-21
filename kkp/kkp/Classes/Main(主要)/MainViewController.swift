//
//  MainViewController.swift
//  kkp
//
//  Created by Lo on 2018/6/20.
//  Copyright © 2018年 Lo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bgView = UIView()
        bgView.frame = view.bounds

        bgView.backgroundColor = UIColor.init(patternImage: UIImage(named: "bg.png")!)

        view.addSubview(bgView)
        
        
//        let topView = UIView()
//        let bjViewImage = UIImage.init(named: "bg.png")
//        // 设置 topView 的背景图片
//        topView.layer.contents = bjViewImage?.cgImage
//
//        view.addSubview(topView)
//
        
    }

    
}
