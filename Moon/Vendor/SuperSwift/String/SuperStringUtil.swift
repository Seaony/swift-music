//
// Created by seaony on 2023/3/25.
//

import Foundation
import SwifterSwift

class SuperStringUtil {

    /// 判断字符串是否为空
    ///
    /// - Parameter data: 字符串
    /// - Returns: true: 空 false: 非空
    static func isBlank(_ data: String?) -> Bool {
        guard let data = data else {
            return true // 如果 data 为 nil，则认为它是空字符串
        }
        return data.trimmed.isEmpty
    }

    /// 判断字符串是否非空
    ///
    /// - Parameter data: 字符串
    /// - Returns: true: 非空 false: 空
    static func isNotBlank(_ data: String?) -> Bool { !isBlank(data) }
}
