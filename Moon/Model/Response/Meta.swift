//
//  Meta.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import HandyJSON

class Meta<T: HandyJSON>: BaseModel {

    // 真实数据
    var data: [T]?
    
    // 有多少条
    var total: Int!
    
    // 有多少页
    var pages: Int!
    
    // 当前每页显示多少条
    var size: Int!
    
    // 当前页
    var page: Int!
    
    // 下一页
    var next: Int?
    
}
