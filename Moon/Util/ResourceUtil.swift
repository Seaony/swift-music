//
//  ResourceUtil.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Foundation

class ResourceUtil {
    
    /// 将资源从相对路径转换为绝对路径
    static func resourceUri(_ data: String) -> String {
        
        return "\(Config.RESOURCE_ENDPOINT)/\(data)"
        
    }
    
}
