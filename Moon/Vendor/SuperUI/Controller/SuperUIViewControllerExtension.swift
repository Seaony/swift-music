//
// Created by seaony on 2023/3/26.
//

import UIKit
import Foundation

extension UIViewController {

    /// 此方法用于查找并返回合适的 UINavigationController 实例。
    /// 它首先检查当前类的 navigationController 属性。如果存在，则返回该实例。
    /// 如果当前类的 navigationController 不存在，它会检查 UIApplication 的 keyWindow 的 rootViewController。
    /// 如果 rootViewController 是 UINavigationController 类型，则返回该实例。
    /// 否则，尝试从 rootViewController 的 navigationController 属性中获取 UINavigationController 实例。
    /// 如果以上所有条件都无法找到 UINavigationController 实例，则返回 nil。
    func findNavigationController() -> UINavigationController? {
        // 如果在本类中可以找到 navigationController，就使用本类中的 navigationController
        if let currentNavController = self.navigationController {
            return currentNavController
        }

        // 获取当前 keyWindow 的 rootViewController
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }

        // 如果 rootViewController 是 UINavigationController 类型，则直接返回
        if let rootNavController = rootViewController as? UINavigationController {
            return rootNavController
        }

        // 否则，尝试从 rootViewController 的 navigationController 属性中获取 UINavigationController
        return rootViewController.navigationController
    }

    // 跳转至对应的 Controller
    func startController(_ data: UIViewController) {
        findNavigationController()!.pushViewController(data, animated: true)
    }

    func startController(_ data: UIViewController.Type) {
        let target = data.init()
        findNavigationController()!.pushViewController(target, animated: true)
    }
}
