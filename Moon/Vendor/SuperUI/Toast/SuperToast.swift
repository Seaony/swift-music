//
//  SuperToast.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit

class SuperToast {
    
    static var hud:MBProgressHUD?
    
    // 展示
    static func show (title: String) {
        
        let hud = MBProgressHUD.showAdded(to: AppDelegate.shared.window!.rootViewController!.view, animated: true)
        
        hud.mode = .text
        
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = .black
        
        hud.label.textColor = .colorLightWhite
        hud.label.font = UIFont.boldSystemFont(ofSize: 16)
        hud.label.numberOfLines = 0
        
        hud.label.text = title
        
        let offsetY = -hud.frame.height / CGFloat(2) + 80
  
        hud.offset = CGPoint(x: 0, y: offsetY)
        
        hud.removeFromSuperViewOnHide = true
        
        hud.hide(animated: true, afterDelay: 2)
    }
    
    
    // 加载提示
    static func showLoading(title: String = R.string.localizable.superLoading()) {
        // 更改 Loading 颜色
        UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).color = .white
        
        if SuperToast.hud == nil {
            
            SuperToast.hud = MBProgressHUD.showAdded(to: AppDelegate.shared.window!.rootViewController!.view, animated: true)
            
            SuperToast.hud!.mode = .indeterminate
            
            SuperToast.hud!.minSize = CGSize(width: 120, height: 120)
            
            SuperToast.hud!.backgroundView.style = .solidColor
            SuperToast.hud!.backgroundView.color = UIColor(white: 1, alpha: 0.5)
            
            SuperToast.hud!.bezelView.style = .solidColor
            SuperToast.hud!.bezelView.backgroundColor = .black
            
            SuperToast.hud!.label.textColor = .colorLightWhite
            SuperToast.hud!.label.font = UIFont.boldSystemFont(ofSize: TEXT_LARGE)
            
            SuperToast.hud!.show(animated: true)
            
        }
        
        SuperToast.hud!.label.text = title
        
    }
    
    static func hideLoading() {
        if let r = SuperToast.hud {
            r.hide(animated: true)
            SuperToast.hud = nil
        }
    }
    
}
