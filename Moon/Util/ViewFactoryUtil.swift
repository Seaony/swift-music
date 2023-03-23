//
//  ViewFactoryUtil.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import TangramKit
import Foundation

class ViewFactoryUtil {
    
    /// 创建一个主色调小圆角按钮
    static func primaryButton() -> QMUIButton {
        
        let r = QMUIButton()
        
        // 当用户按下后标题是否根据用户设置的 Tint Color 变色
        r.adjustsTitleTintColorAutomatically = false
        
        // 按下后高亮颜色是否自动调整
        r.adjustsButtonWhenHighlighted = true
        
        // 文字大小
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_LARGE)
        
        // 宽高
        r.tg_width.equal(.fill)
        r.tg_height.equal(BUTTON_MEDDLE)
        
        r.backgroundColor = .colorPrimary
        r.layer.cornerRadius = SMALL_RADIUS
        r.tintColor = .colorLightWhite
        
        // 标题颜色
        r.setTitleColor(.colorLightWhite, for: .normal)
        
        return r
        
    }
    
    /// 定义一个主色调半圆角按钮
    static func primaryHalfFilletButton() -> QMUIButton {
        
        let r = self.primaryButton()
        
        r.layer.cornerRadius = BUTTON_MEDDLE_RADIUS
        
        return r
        
    }
    
    
    /// 主色调文本,小圆角按钮,灰色边框
    /// - Returns: <#description#>
    static func primaryOutlineButton() -> QMUIButton {
        let r = primaryButton()
        r.layer.cornerRadius = SMALL_RADIUS
        
        r.tintColor = .black130
        r.layer.borderWidth = 1
        r.layer.borderColor = UIColor.black130.cgColor
        r.backgroundColor = .clear
        r.setTitleColor(.colorPrimary, for: .normal)
        return r
    }
    
    /// 链接按钮
    static func linkButton() -> QMUIButton {
        
        let r = QMUIButton()
        
        r.adjustsTitleTintColorAutomatically = false
        r.titleLabel?.font = UIFont.systemFont(ofSize: TEXT_MEDDLE)
        
        return r
        
    }
    
}
