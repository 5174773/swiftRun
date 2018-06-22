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
    let UI_WIDHT:CGFloat = 750;
    
    func initilize(width:CGFloat,height:CGFloat) -> Void {
        Display.instance.screenWidth = width;
        Display.instance.screenHeight = height;
    }
    func getSize(size:CGFloat) -> CGFloat {
        return size/UI_WIDHT * screenWidth!;
    }
}
