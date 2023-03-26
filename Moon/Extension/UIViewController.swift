//
//  ViewControllerLogicExtension.swift
//  对控制器扩展业务相关逻辑
//  例如：判断是否登录，跳转到登录界面等
//
//  Created by smile on 2022/7/8.
//

import UIKit

extension UIViewController{
    //MARK: - 登录相关

    /// 只要用户登录了，才会执行代码块
    /// - Parameter data: <#data description#>
    func loginAfter(_ data:(()->Void)) {
        if PreferenceUtil.isLogin() {
            data()
        } else {
            toLogin()
        }
    }

    /// 启动登录界面
    func toLogin() {
        startController(LoginHomeController.self)
    }
}
