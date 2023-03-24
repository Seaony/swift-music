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
    
    private init () {
        provider = MoyaProvider<DefaultService>()
    }
    
}
