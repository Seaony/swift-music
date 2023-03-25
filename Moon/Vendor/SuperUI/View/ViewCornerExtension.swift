//
// Created by seaony on 2023/3/24.
//

import UIKit

extension UIView {

    func largeCorner () {
        corner(SuperConfig.SIZE_LARGE_RADIUS)
    }

    func smallCorner() {
        corner(SuperConfig.SIZE_SMALL_RADIUS)
    }

    // 设置圆角
    func corner(_ radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }

    // 设置边框
    func border(_ color: UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
    }
}
