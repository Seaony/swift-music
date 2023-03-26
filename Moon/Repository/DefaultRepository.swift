//
//  DefaultRepository.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Foundation
import Moya
import RxSwift
import HandyJSON

class DefaultRepository {

    static let shared = DefaultRepository()

    private var provider:MoyaProvider<DefaultService>!

    // 轮播图的广告位
    func bannerAds() -> Observable<ListResponse<Ad>> {
        return provider
            .rx
            .request(.ads(position: VALUE0))
            .asObservable()
            .mapString()
            .mapObject(ListResponse<Ad>.self)
    }

    // 歌单的列表
    func sheets(size: Int) -> Observable<ListResponse<Sheet>> {
        return provider
            .rx
            .request(.sheets(size: size))
            .asObservable()
            .mapString()
            .mapObject(ListResponse<Sheet>.self)
    }

    // 歌单的详情
    func sheetDetail(data: String) -> Observable<DetailResponse<Sheet>> {
        return provider
            .rx
            .request(.sheetDetail(data: data))
            .asObservable()
            .mapString()
            .mapObject(DetailResponse<Sheet>.self)
    }

    // 歌曲的列表
    func songs(size: Int) -> Observable<ListResponse<Song>> {
        return provider
                .rx
                .request(.songs)
                .asObservable()
                .mapString()
                .mapObject(ListResponse<Song>.self)
    }

    // 歌曲的详情
    func songDetail(data: String) -> Observable<DetailResponse<Song>> {
        return provider
                .rx
                .request(.songDetail(data: data))
                .asObservable()
                .mapString()
                .mapObject(DetailResponse<Song>.self)
    }

    // 用户的详情
    func userDetail(_ data: String, _ nickname: String? = nil) -> Observable<DetailResponse<User>> {
        return provider
                .rx
                .request(.userDetail(data: data, nickname: nickname))
                .asObservable()
                .mapString()
                .mapObject(DetailResponse<User>.self)
    }

    func register(_ data:User) -> Observable<DetailResponse<BaseModel>> {
        return provider
                .rx
                .request(.register(data: data))
                .filterSuccessfulStatusCodes()
                .mapString()
                .asObservable()
                .mapObject(DetailResponse<BaseModel>.self)
    }

    func login(_ data:User) -> Observable<DetailResponse<Session>> {
        return provider
                .rx
                .request(.login(data: data))
                .filterSuccessfulStatusCodes()
                .mapString()
                .asObservable()
                .mapObject(DetailResponse<Session>.self)
    }

    private init () {

        // 插件列表
        var plugins:[PluginType] = []

        if Config.DEBUG {
            // 调试模式
            plugins.append(NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)))
        }

        //网络请求加载对话框
        let networkActivityPlugin = NetworkActivityPlugin { change, target in
            //changeType类型是NetworkActivityChangeType
            //通过它能监听到开始请求和结束请求

            //targetType类型是TargetType
            //就是我们这里的service
            //通过它能判断是那个请求
            if change == .began {
                //开始请求
                let targetType = target as! DefaultService

                switch targetType {
                case .sheetDetail,.register:
                    DispatchQueue.main.async {
                        //切换到主线程
                        SuperToast.showLoading()
                    }
                default:
                    break
                }
            } else {
                //结束请求
                DispatchQueue.main.async {
                    SuperToast.hideLoading()
                }
            }
        }

        plugins.append(networkActivityPlugin)

        provider = MoyaProvider<DefaultService>(plugins: plugins)
    }

}
