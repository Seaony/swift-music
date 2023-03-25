//
//  SuperImageExtension.swift
//  Moon
//
//  Created by seaony on 2023/3/24.
//

import UIKit

extension UIImage {
    
    func withTintColor() -> UIImage {
        
        let result = self.withRenderingMode(.alwaysTemplate)
        return result
        
    }
    
}
