//
//  ParamUtil.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Moya
import Foundation

class ParamUtil {
    
    // 返回 URL 编码的参数
    static func urlRequestParamters(_ data: [String:Any]) -> Task {
        return .requestParameters(parameters: data, encoding: URLEncoding.default)
    }
    
}
