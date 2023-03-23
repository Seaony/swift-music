//
//  BaseResponse.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Foundation

class BaseResponse: BaseModel {
    
    // 状态码
    var status: Int = 0
    
    // 错误信息
    var message: String?

}
