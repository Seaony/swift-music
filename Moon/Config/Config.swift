//
//  Config.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Foundation

class Config {
    /**
    * 是否是调试模式
    * 是因为单独定了一个变量更方便，不用真正更改项目的编译模式
    */
   static let DEBUG = true
    
    /// 本地端点
    //static let ENDPOINT = "http://192.168.50.51:8080/"

    /// 我们爱学啊部署好的
    static let ENDPOINT = "http://my-cloud-music-api-sp3-dev.ixuea.com/"

    /**
     * 资源端点
     */
    static let RESOURCE_ENDPOINT = "http://course-music-dev.ixuea.com/"
}
