//
//  ObservableMoyaExtension.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Moya
import RxSwift
import HandyJSON
import Foundation

public enum IxueaError: Swift.Error {
    // 表示 JSON 解析为对象失败了
    case objectMapping
    
}

// MARK: - 扩展Observable
extension Observable{
    
    /// 将字符串解析为对象
    ///
    /// - Parameter type: 要转为的类
    /// - Returns: 转换后的观察者对象
    public func mapObject<T:HandyJSON>(_ type:T.Type) -> Observable<T> {
        map { data in
            //将参数尝试转为字符串
            guard let dataString = data as? String else {
                //data不能转为字符串
                throw IxueaError.objectMapping
            }
            
            guard let result = type.deserialize(from: dataString) else{
                throw IxueaError.objectMapping
            }
            
            //解析成功
            //返回解析后的对象
            return result
        }
        
    }
    
}
