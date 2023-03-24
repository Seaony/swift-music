//
//  ExceptionHandlerUtil.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Moya
import Alamofire
import Foundation

class ExceptionHandlerUtil {
    
    // 处理网络响应
    static func handlerResponse (_ data: BaseResponse?=nil, _ error: Error?=nil) {
        
        if error != nil {
            
            handlerError(error!)
            
        } else {
            
            if let r = data?.message {
                
                SuperToast.show(title: r)
                
            } else {
                SuperToast.show(title: R.string.localizable.errorUnknown())
            }
            
        }
        
    }
    
    static func handlerError(_ error: Error) {
        
        if let error = error as? MoyaError {
            
            switch error {
                
            case.stringMapping(_):
                SuperToast.show(title: "响应转为字符串错误")
                
            case.statusCode(let response):
                
                let code = response.statusCode
                
                handleHttpError(code)
                
            case.underlying(_, _):
                
                if let alamofireError = error.errorUserInfo["NSUnderlyingError"] as? Alamofire.AFError,
                   let underlyingError = alamofireError.underlyingError as? NSError {
                    
                    switch underlyingError.code {
                        
                    case NSURLErrorNotConnectedToInternet:
                        SuperToast.show(title: R.string.localizable.networkError())
                        
                    case NSURLErrorTimedOut:
                        SuperToast.show(title: R.string.localizable.errorNetworkTimeout())
                        
                    case NSURLErrorCannotFindHost:
                        SuperToast.show(title: R.string.localizable.errorNetworkUnknownHost())
                        
                    case NSURLErrorCannotConnectToHost:
                        SuperToast.show(title: R.string.localizable.errorNetworkUnknownHost())
                        
                    default:
                        SuperToast.show(title: R.string.localizable.errorUnknown())
                    }
                    
                } else {
                    SuperToast.show(title: R.string.localizable.errorUnknown())
                }
                
            default:
                
                SuperToast.show(title: R.string.localizable.errorUnknown())
                
            }
            
        }
        
    }
    
    static func handleHttpError (_ data: Int) {
        switch data {
        
        case 401:
            SuperToast.show(title: R.string.localizable.errorNetworkNotAuth())
            AppDelegate.shared.logout()
            
        case 403:
            SuperToast.show(title: R.string.localizable.errorNetworkNotPermission())
            
        case 404:
            SuperToast.show(title: R.string.localizable.errorNetworkNotFound())
            
        case 500..<599:
            SuperToast.show(title: R.string.localizable.errorNetworkServer())
            
        default:
            SuperToast.show(title: R.string.localizable.errorUnknown())
            
        }
    }
    
}
