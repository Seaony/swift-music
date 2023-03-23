//
//  DetailResponse.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import HandyJSON
import Foundation


class DetailResponse<T: HandyJSON>: BaseResponse {

    // 真实数据
    var data: T?
    
    init (_ data: T) {
        
        self.data = data
        
    }
    
    required init() {
        
        super.init()
        
    }
    
}
