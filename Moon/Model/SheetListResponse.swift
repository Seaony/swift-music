//
//  SheetListResponse.swift
//  歌单列表
//
//  Created by seaony on 2023/3/24.
//

import HandyJSON
import Foundation


class SheetListResponse: HandyJSON {
    
    var status: Int = 0
    
    var data: PageResponse!
    
    required init() {}
    
}
