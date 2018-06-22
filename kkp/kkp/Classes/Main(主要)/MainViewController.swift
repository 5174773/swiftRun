//
//  MainViewController.swift
//  kkp
//
//  Created by Lo on 2018/6/20.
//  Copyright © 2018年 Lo. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    var box = UIView()
    var titleLabel = UILabel() //标题标签
    var womanButton = UIButton()
    var manButton = UIButton()
    var plabel = UILabel() //便签
    var myLabel = UILabel()
    var startBtton  = UIButton()
    
    
    
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //设置背景图
        let bgView = UIImageView()
        bgView.frame = UIScreen.main.bounds
        bgView.image = UIImage(named: "bg.png")
        bgView.contentMode = .scaleAspectFill
        self.view.addSubview(bgView)
        
        
        //标题label
        self.titleLabel = UILabel()
        self.titleLabel.text = "I am a"
        self.titleLabel.textColor = UIColor(hex: "#343434")
        self.titleLabel.font = UIFont.systemFont(ofSize: 36)
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (mask) in
            mask.left.equalTo(47)
            mask.top.equalTo(115)
        }
        
        // woman 按钮
        self.womanButton.setTitle("Woman", for: .normal)
        self.womanButton.setTitleColor(UIColor(hex: "#c1c1c1"), for: .normal)
        self.womanButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        
//        self.womanButton.layer.backgroundColor = UIColor(hex: "#c1c1c1")?.cgColor
//        self.womanButton.frame = CGRect(x: self.womanButton.frame.origin.x, y: self.womanButton.frame.origin.y, width: 280, height: 49)
        self.womanButton.layer.borderWidth = 2
        self.womanButton.layer.cornerRadius = 7
        self.womanButton.layer.borderColor = UIColor(hex: "#c1c1c1")?.cgColor
        self.womanButton.addTarget(self, action: #selector(loginConfrim),
                                     for: .touchUpInside)
        self.view.addSubview(self.womanButton)
        self.womanButton.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.titleLabel.snp.bottom).offset(31)
            mask.left.equalTo(47.5)
            mask.right.equalTo(-47.5)
            mask.height.equalTo(49)
            
        }
        
        
        //Man 按钮
        self.manButton.setTitle("Man", for: .normal)
        self.manButton.setTitleColor(UIColor(hex: "#c1c1c1"), for: .normal)
        self.manButton.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        
        self.manButton.layer.borderWidth = 2
        self.manButton.layer.cornerRadius = 7
        self.manButton.layer.borderColor = UIColor(hex: "#c1c1c1")?.cgColor
        self.manButton.addTarget(self, action: #selector(manButtonfrim) ,
                                 for:.touchDragInside )
        self.view.addSubview(self.manButton)
        self.manButton.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.womanButton.snp.bottom).offset(18)
            mask.left.equalTo(47.5)
            mask.right.equalTo(-47.5)
            mask.height.equalTo(49)
        }
        
        // Please choose your gender
        self.plabel.text = "Please choose your gender"
        self.plabel.textColor = UIColor(hex: "#ff395e")
        self.plabel.font = UIFont.boldSystemFont(ofSize: 12)
        self.view.addSubview(self.plabel)
        self.plabel.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.manButton.snp.bottom).offset(14)
            mask.left.equalTo(47.5)
        }
        
        // My birthday is
        self.myLabel.text = "My birthday is"
        self.myLabel.textColor = UIColor(hex: "#343434")
        self.myLabel.font = UIFont.boldSystemFont(ofSize: 26)
        self.view.addSubview(self.myLabel)
        self.myLabel.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.manButton.snp.bottom).offset(56)
            mask.left.equalTo(47)
        }
        
        
        
        //start  登录按钮
        self.startBtton.setTitle("Start", for: .normal)
        self.startBtton.setTitleColor(UIColor(hex: "#ffffff"), for: .normal)
        self.startBtton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
//        self.startBtton.frame = CGRect(x: self.startBtton.frame.origin.x, y: self.startBtton.frame.origin.y, width: 280, height: 52)
        self.startBtton.setBackgroundImage(UIImage(named: "login_bg_mask"), for: .normal)
        self.startBtton.layer.cornerRadius = 7
        self.startBtton.layer.masksToBounds = true
        self.view.addSubview(self.startBtton)
        self.startBtton.snp.makeConstraints { (mask) in
//            mask.width.equalTo(280)
            
            mask.bottom.equalTo(-59)
            mask.left.equalTo(47.5)
            mask.right.equalTo(-47.5)
            mask.height.equalTo(52)
        }
        
        
        
        
   
    
     
    }
    
    //woman 点击事件
    @objc func loginConfrim(){
        
    }
    
    //man 点击事件
    @objc func manButtonfrim(){
        
    }
    
    
    }




    
    


    

