//
//  BannerData.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit
import HandyJSON
import Foundation

class Song: BaseCommon {

    // 名称
    var title: String!

    // 图标
    var icon: String?

    // 音乐地址
    var uri: String!

    // 点击数
    var clicksCount: Int = 0

    // 评论数
    var commentsCount: Int = 0

    // 创建音乐的人
    var user: User!

    // 歌手
    var singer: User!

    // 处理驼峰字段
    override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        mapper <<< self.clicksCount <-- "clicks_count"
        mapper <<< self.commentsCount <-- "comments_count"
    }
}
