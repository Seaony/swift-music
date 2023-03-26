//
//  DefaultService.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Moya
import Foundation

enum DefaultService {

    // 广告列表
    case ads(position: Int)

    // 歌单列表
    case sheets(size: Int)

    // 歌单详情
    case sheetDetail(data: String)

    // 注册
    case register(data: User)

    // 登录
    case login(data: User)

    // 单曲
    case songs

    // 单曲详情
    case songDetail(data: String)

}

// MARK: 实现 TargetType 协议
extension DefaultService: TargetType {

    /// 返回网址
    var baseURL: URL {
        return URL(string: Config.ENDPOINT)!
    }

    /// 返回每一个请求的路径
    var path: String {
        switch self {

        case .ads(_):
            return "v1/ads"

        case .sheets(_):
            return "v1/sheets"

        case .sheetDetail(let data):
            return "v1/sheets/\(data)"

        case .songs:
            return "v1/songs"

        case .songDetail(let data):
            return "v1/songs/\(data)"

        case .register(_):
            return "v1/users"

        case .login:
            return "v1/sessions"

//        default:
//            fatalError("DefaultService Path is Null")
        }
    }

    /// 返回每个请求的 Method
    var method: Moya.Method {

        switch self {

        case .register(_), .login:
            return .post

        default:
            return .get

        }

    }

    // 请求参数
    var task: Moya.Task {
        switch self {

        case .ads(let position):
            return ParamUtil.urlRequestParamters(["position": position])

        case .sheets(let size):
            return ParamUtil.urlRequestParamters(["size": size])

        case .login(let data):
            return .requestData(data.toJSONString()!.data(using: .utf8)!)

        default:
            return .requestPlain

        }
    }

    // 请求头
    var headers: [String : String]? {

        var headers:Dictionary<String, String> = [:]

        headers["Content-Type"] = "application/json"

        return headers

    }
}
