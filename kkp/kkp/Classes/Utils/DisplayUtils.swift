//
//  File.swift
//  kkp
//
//  Created by Lo on 2018/6/22.
//  Copyright © 2018年 Lo. All rights reserved.
//

import Foundation
import UIKit

class Display{
    static let instance:Display = Display()
    var screenWidth:CGFloat? = nil
    var screenHeight:CGFloat? = nil
    static let UI_WIDHT:CGFloat = 750;
    
    static func initilize(width:CGFloat,height:CGFloat) -> Void {
        Display.instance.screenWidth = width;
        Display.instance.screenHeight = height;
    }
    static func getSize(size:CGFloat) -> CGFloat {
        return size/UI_WIDHT * instance.screenWidth!;
    }
    
    static func mixColor(view:UIView,from:String,to:String)->CAGradientLayer{
            //绿色
            let TColor = UIColor(hex: from)
            //蓝色
            let BColor = UIColor(hex: to)
            //将颜色和颜色的位置定义在数组内
            let gradientColors: [CGColor] = [TColor!.cgColor, BColor!.cgColor]
            //创建并实例化CAGradientLayer
        
            let gradientLayer: CAGradientLayer = CAGradientLayer()
            gradientLayer.colors = gradientColors
            //(这里的起始和终止位置就是按照坐标系,四个角分别是左上(0,0),左下(0,1),右上(1,0),右下(1,1))
            //渲染的起始位置
            gradientLayer.startPoint = CGPoint(x:0, y:0)
            //渲染的终止位置
            gradientLayer.endPoint = CGPoint(x:1, y:0)
            //设置frame和插入view的layer
            gradientLayer.frame = view.bounds
            return gradientLayer;
            
        }

        
    }
    

