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
extension Observable {
    
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

// MARK: - 扩展ObservableType
// 目的是添加两个自定义监听方法
// 一个是只观察请求成功的方法
// 一个既可以观察请求成功也可以观察请求失败
extension ObservableType {
    
    /// 观察成功的事件
    ///
    /// - Parameter onSuccess: <#onSuccess description#>
    /// - Returns: <#return value description#>
    func subscribeSuccess (_ success: @escaping ((Element) -> Void)) -> Disposable {
        
        let disposable = Disposables.create()
               
        let observer = HttpObserver<Element>(success, nil)
        
        return Disposables.create(self.asObservable().subscribe(observer), disposable)
        
    }
    
    /// 观察成功和失败事件
     ///
     /// - Parameter onSuccess: <#onSuccess description#>
     /// - Returns: <#return value description#>
     func subscribe(_ success: @escaping ((Element)-> Void),_ error: @escaping ((BaseResponse?, Error?) -> Bool)) -> Disposable {
         //创建一个Disposable
         let disposable = Disposables.create()
         
         //创建一个HttpObserver
         let observer = HttpObserver<Element>(success, error)
         
         //创建并返回一个Disposables
         return Disposables.create(self.asObservable().subscribe(observer),disposable)
     }
    
}

public class HttpObserver<Elemet>: ObserverType {
    
    public typealias successCallback = ((Element) -> Void)
    
    var success: successCallback
    
    var error: ((BaseResponse?, Error?) -> Bool)?
    
    init (_ success: @escaping successCallback, _ error: ((BaseResponse?, Error?) -> Bool)? ) {
        self.success = success
        self.error = error
    }
    
    
    /// 当 RxSwift 发送了事件回调
    public func on(_ event: Event<Elemet>) {
        switch event {
        
        case .next(let data):
            
            print("Success \(data)")
            
            // 尝试将值转为 BaseResponse
            let baseResponse = data as? BaseResponse
            
            if baseResponse?.status != 0 {
                handleResponse(baseResponse: baseResponse)
            } else {
                success(data)
            }
            
        case .error(let error):
            
            print("Error \(error)")
            
        case .completed:
            
            print("Done")
            
        }
    }
    
    // 尝试处理错误
    func handleResponse (baseResponse: BaseResponse?=nil, error: Error?=nil) {
        
        if self.error != nil && self.error!(baseResponse, error) {
            
            // 回调失败 Block
            // 返回 True，父类不自动处理错误

            
        } else {
            
            ExceptionHandlerUtil.handlerResponse(baseResponse, error)
            
        }
        
    }
}
