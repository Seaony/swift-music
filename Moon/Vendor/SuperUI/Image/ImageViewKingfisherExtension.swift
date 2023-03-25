//
// Created by seaony on 2023/3/25.
//

import UIKit
import Kingfisher

extension UIImageView {

    /// 从网络加载图片
    ///
    /// - Parameters:
    ///   - data: 图像链接
    ///   - defaultImage: 默认图像名称
    func show(_ data: String?, _ defaultImage: String = "Placeholder") {
        SuperStringUtil.isBlank(data)
                ? image = UIImage(named: defaultImage)
                : showFull(data!.starts(with: "http") ? data! : data!.absoluteUri())
    }

    /// 展示头像
    ///
    /// - Parameter data: 头像图像链接
    func showAvatar(_ data: String?) {
        show(data, "DefaultAvatar")
    }

    /// 展示图像
    func showFull(_ data: String) {
        kf.indicatorType = .activity
        kf.setImage(with: URL(string: data))
    }

}
