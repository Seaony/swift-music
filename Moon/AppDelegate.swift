//
//  AppDelegate.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import SwiftEventBus

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /// 定义一个静态的计算属性
    /// 在外界就可以拿到 AppDelegate
    open class var shared: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        initMMKV()

        // 设置默认显示的界面
        let controller = SplashViewController()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = controller
        window?.makeKeyAndVisible()

        if PreferenceUtil.isLogin() {
            onLogin(nil)
        }
        return true
    }

    func initMMKV() {
        MMKV.initialize(rootDir: nil)
    }

    /// 跳转到引导界面
    func toGuide() {
        let r = GuideController()
        setRootViewController(r)
    }

    /// 跳转到首页
    func toMain() {
        let r = UINavigationController(rootViewController: MainController())
        setRootViewController(r)
    }

    /// 跳转到登录页面
    func toLogin() {
        toMain()
        // 发送一个跳转到登录界面的通知，在发现界面处理
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(Constant.EVENT_LOGIN_CLICK), object: nil)
        }
    }

    func onLogin(_ data: Session?) {
        if let _ = window {
            let navigationController = window!.rootViewController as! UINavigationController
            let vcs = navigationController.viewControllers
            var results: [UIViewController] = []
            for it in vcs {
                if it is LoginHomeController ||
                           it is LoginController {
                    continue
                }
                results.append(it)
            }
            navigationController.setViewControllers(results, animated: true)
        }
        loginStatusChanged()
    }

    func setRootViewController(_ data: UIViewController) {
        window!.rootViewController = data
    }

    // 退出登录
    func logout() {
        logoutSilence()
    }

    func logoutSilence () {
        PreferenceUtil.logout()
        loginStatusChanged()
    }

    func loginStatusChanged() {
        SwiftEventBus.post(Constant.EVENT_LOGIN_STATUS_CHANGED)
    }
}

