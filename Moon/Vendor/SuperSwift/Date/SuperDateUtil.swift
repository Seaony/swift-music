//
//  SuperDateUtil.swift
//  日期工具类
//
//  Created by seaony on 2023/3/24.
//

import Foundation

class SuperDateUtil {
    
    static func currentYear() -> Int {
        
        // 获取当前日期
        let date = Date()
        
        // 实例化日历类
        let calender = Calendar.current
        
        let d = calender.dateComponents([Calendar.Component.year], from: date)
        
        return d.year!
        
    }
    
    static func currentDay() -> Int {
        
        // 获取当前日期
        let date = Date()
        
        // 实例化日历类
        let calender = Calendar.current
        
        let d = calender.dateComponents([Calendar.Component.day], from: date)
        
        return d.day!
        
    }
    
}
