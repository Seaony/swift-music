//
//  ListResponse.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Foundation
import HandyJSON

class ListResponse<T: HandyJSON>: BaseResponse {
    
    var data: Meta<T>!
    
}
