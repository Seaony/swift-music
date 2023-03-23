//
//  PageResponse.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import HandyJSON
import Foundation


class PageResponse: HandyJSON {
    
    var total: Int = 0
    
    var pages: Int = 0
    
    var data: [Sheet]!
    
    required init() {}
    
}
