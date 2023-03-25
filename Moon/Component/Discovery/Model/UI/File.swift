//
//  File.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import Foundation

class ButtonData {
    
    var title: String!
    
    var icon: UIImage!
    
    lazy var datum: [ButtonData] = {
        
        var r: [ButtonData] = []
        
        r.append(ButtonData(R.string.localizable.dayRecommend(), R.image.dayRecommend()))
        r.append(ButtonData(R.string.localizable.personFm(), R.image.personFm()))
        r.append(ButtonData(R.string.localizable.sheet(), R.image.sheet()))
        r.append(ButtonData(R.string.localizable.rank(), R.image.rank()))
        r.append(ButtonData(R.string.localizable.live(), R.image.buttonLive()))
        r.append(ButtonData(R.string.localizable.digitalAlbum(), R.image.digitalAlbum()))
        r.append(ButtonData(R.string.localizable.digitalAlbum(), R.image.digitalAlbum()))
        
        return r
        
    }()
    
    init(_ title: String!, _ icon: UIImage!) {
        self.title = title
        self.icon = icon
    }
    
    init () {}
    
}
