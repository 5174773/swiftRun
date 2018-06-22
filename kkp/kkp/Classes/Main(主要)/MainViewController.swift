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
    var line = UILabel()
    var yourLabel = UILabel()

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
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: (Display.instance.getSize(size: 52)))
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (mask) in
            mask.left.equalTo(Display.instance.getSize(size: 94))
            mask.top.equalTo(Display.instance.getSize(size: 230))
        }
        
        // woman 按钮
        self.womanButton.setTitle("Woman", for: .normal)
        self.womanButton.setTitleColor(UIColor(hex: "#c1c1c1"), for: .normal)
        self.womanButton.titleLabel?.font = UIFont.systemFont(ofSize:(Display.instance.getSize(size: 56)))
        
//        self.womanButton.layer.backgroundColor = UIColor(hex: "#c1c1c1")?.cgColor
//        self.womanButton.frame = CGRect(x: self.womanButton.frame.origin.x, y: self.womanButton.frame.origin.y, width: 280, height: 49)
        self.womanButton.layer.borderWidth = 2
        self.womanButton.layer.cornerRadius = 7
        self.womanButton.layer.borderColor = UIColor(hex: "#c1c1c1")?.cgColor
        self.womanButton.addTarget(self, action: #selector(loginConfrim),
                                     for: .touchUpInside)
        self.view.addSubview(self.womanButton)
        self.womanButton.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.titleLabel.snp.bottom).offset(Display.instance.getSize(size: 62))
            mask.left.equalTo(Display.instance.getSize(size: 95))
            mask.right.equalTo(Display.instance.getSize(size: -95))
            mask.height.equalTo(Display.instance.getSize(size: 98))
            
        }
        
        
        //Man 按钮
        self.manButton.setTitle("Man", for: .normal)
        self.manButton.setTitleColor(UIColor(hex: "#c1c1c1"), for: .normal)
        self.manButton.titleLabel?.font = UIFont.systemFont(ofSize: Display.instance.getSize(size: 56))
        
        self.manButton.layer.borderWidth = 2
        self.manButton.layer.cornerRadius = 7
        self.manButton.layer.borderColor = UIColor(hex: "#c1c1c1")?.cgColor
        self.manButton.addTarget(self, action: #selector(manButtonfrim) ,
                                 for:.touchDragInside )
        self.view.addSubview(self.manButton)
        self.manButton.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.womanButton.snp.bottom).offset(Display.instance.getSize(size: 36))
            mask.left.equalTo(Display.instance.getSize(size: 95))
            mask.right.equalTo(Display.instance.getSize(size: -95))
            mask.height.equalTo(Display.instance.getSize(size: 98))
        }
        
        // Please choose your gender
        self.plabel.text = "Please choose your gender"
        self.plabel.textColor = UIColor(hex: "#ff395e")
        self.plabel.font = UIFont.boldSystemFont(ofSize: Display.instance.getSize(size: 24))
        self.view.addSubview(self.plabel)
        self.plabel.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.manButton.snp.bottom).offset(Display.instance.getSize(size: 28))
            mask.left.equalTo(Display.instance.getSize(size: 95))
        }
        
        // My birthday is
        self.myLabel.text = "My birthday is"
        self.myLabel.textColor = UIColor(hex: "#343434")
        self.myLabel.font = UIFont.boldSystemFont(ofSize: Display.instance.getSize(size: 52))
        self.view.addSubview(self.myLabel)
        self.myLabel.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.manButton.snp.bottom).offset(Display.instance.getSize(size: 112))
            mask.left.equalTo(Display.instance.getSize(size: 95))
        }
        
        
        // 线
        self.line.text = "- - - - / - - / - -"
        self.line.textColor = UIColor(hex: "#c1c1c1")
        self.line.font = UIFont.boldSystemFont(ofSize: Display.instance.getSize(size: 56))
        self.view.addSubview(self.line)
        self.line.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.myLabel.snp.bottom).offset(Display.instance.getSize(size: 95))
            mask.left.equalTo(Display.instance.getSize(size: 95))
            mask.right.equalTo(Display.instance.getSize(size: -95))
            
        }
        // 线
        self.yourLabel.text = "your age will be public"
        self.yourLabel.textColor = UIColor(hex: "#c1c1c1")
        self.yourLabel.font = UIFont.boldSystemFont(ofSize: Display.instance.getSize(size: 24))
        self.view.addSubview(self.yourLabel)
        self.yourLabel.snp.makeConstraints { (mask) in
            mask.top.equalTo(self.line.snp.bottom).offset(Display.instance.getSize(size: 24))
            mask.left.equalTo(Display.instance.getSize(size: 95))
            
            
        }
        
        
        
        //start  登录按钮
        self.startBtton.setTitle("Start", for: .normal)
        self.startBtton.setTitleColor(UIColor(hex: "#ffffff"), for: .normal)
        self.startBtton.titleLabel?.font = UIFont.boldSystemFont(ofSize: Display.instance.getSize(size: 48))
//        self.startBtton.frame = CGRect(x: self.startBtton.frame.origin.x, y: self.startBtton.frame.origin.y, width: 280, height: 52)
        self.startBtton.setBackgroundImage(UIImage(named: "login_bg_mask"), for: .normal)
        self.startBtton.layer.cornerRadius = 7
        self.startBtton.layer.masksToBounds = true
        self.view.addSubview(self.startBtton)
        self.startBtton.snp.makeConstraints { (mask) in
//            mask.width.equalTo(280)
            
            mask.bottom.equalTo(Display.instance.getSize(size: -108))
            mask.left.equalTo(Display.instance.getSize(size: 90))
            mask.right.equalTo(Display.instance.getSize(size: -90))
            mask.height.equalTo(Display.instance.getSize(size: 104))
        }
        
        
        
        
   
    
     
    }
    
    //woman 点击事件
    @objc func loginConfrim(){
        
    }
    
    //man 点击事件
    @objc func manButtonfrim(){
        
    }
    
    
    }




    
    


    

