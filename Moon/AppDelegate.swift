//
//  AppDelegate.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit

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
        
        
        // 设置默认显示的界面
        let controller = SplashViewController()
                
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }
    
    /// 跳转到引导界面
    func toGuide () {
        
        let r = GuideController()
        
        setRootViewController(r)
        
    }
    
    /// 跳转到首页
    func toMain () {
        
        let r = UINavigationController(rootViewController: MainController())
        
        setRootViewController(r)
        
    }
    
    /// 跳转到登录页面
    func toLogin () {
        
        toMain()
        
        // 发送一个跳转到登录界面的通知，在发现界面处理
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(Constant.EVENT_LOGIN_CLICK), object: nil)
        }
        
    }
    
    func setRootViewController (_ data: UIViewController) {
        
        window!.rootViewController = data
        
    }
    
    // 退出登录
    func logout () {}

}

