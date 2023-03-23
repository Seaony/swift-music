//
//  DefaultPreferenceUtil.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Foundation

class DefaultPreferenceUtil {
    
    /// 是否同意了用户条款
       /// - Parameter data: <#data description#>
       /// - Returns: <#description#>
       static func isAcceptTermsServiceAgreement() -> Bool {
           return UserDefaults.standard.bool(forKey: TERMS_SERVICE)
       }
       
       /// 设置同意了用户协议
       /// - Parameter data: <#data description#>
       static func setAcceptTermsServiceAgreement(_ data:Bool) {
           UserDefaults.standard.set(data, forKey: TERMS_SERVICE)
       }
       
       static let TERMS_SERVICE = "TERMS_SERVICE"
    
}
