//
//  StringUtil.swift
//  字符串工具类
//
//  Created by smile on 2022/7/7.
//

import Foundation

class StringUtil {

    /// 是否符合密码格式
    /// - Parameter data: 要判断的值
    /// - Returns: true：符合;false：不符合
    static func isPassword(_ data:String) -> Bool {
        return data.count >= 6 && data.count<=15
    }

    /// 是否符合昵称格式
    /// - Parameter data: <#data description#>
    /// - Returns: <#description#>
    static func isNickname(_ data:String) -> Bool {
        return data.count >= 2 && data.count<=10
    }

    /// 格式化数量
    static func formatCount(_ data:Int) -> String  {
        if data > 99 {
            return "99+"
        }

        return "\(data)"
    }

}
