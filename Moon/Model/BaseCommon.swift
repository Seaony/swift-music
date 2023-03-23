//
//  BaseCommon.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Foundation
import HandyJSON

class BaseCommon: BaseId {
    
    var createdAt: String!
    
    var updatedAt: String!
    
    
    override func mapping(mapper: HelpingMapper) {
        super.mapping(mapper: mapper)
        
        mapper <<< self.createdAt <-- "created_at"
        mapper <<< self.updatedAt <-- "updated_at"
    }
}
