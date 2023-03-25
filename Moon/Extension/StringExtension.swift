//
// Created by seaony on 2023/3/25.
//

import Foundation

extension String {

    /// 将资源从相对路径转换为绝对路径
    ///
    /// - Returns: 绝对路径
    func absoluteUri() -> String { "\(Config.RESOURCE_ENDPOINT)/\(self)"}

}
