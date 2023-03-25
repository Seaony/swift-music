//
// Created by seaony on 2023/3/25.
//

import UIKit

extension UIView {

    func hide () {
        tg_visibility = .gone
    }

    func show (_ data: Bool = true) {
        tg_visibility = .visible
    }

    func invisible () {
        tg_visibility = .invisible
    }

    func isShow () -> Bool {
        return tg_visibility == .visible
    }

    func toggle () {
        tg_visibility = tg_visibility == .visible ? .gone : .visible
    }

}
