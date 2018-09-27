//
//  HTTPBinTarget.swift
//  kkp
//
//  Created by Lo on 2018/6/23.
//  Copyright © 2018年 Lo. All rights reserved.
//

import SolarNetwork

public struct HTTPBinTarget: SLTarget {
    public var baseURLString: String { return "https://api.duetin.cn/api/v2/" }
}

let HTTPBinNetwork = SLNetwork(HTTPBinTarget())
