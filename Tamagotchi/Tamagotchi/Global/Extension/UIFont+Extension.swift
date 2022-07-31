//
//  UIFont+Extension.swift
//  Tamagotchi
//
//  Created by 소연 on 2022/08/01.
//

import UIKit

enum FontWeight {
    case bold, medium, regular, semiBold
}

extension UIFont {
    class func pretendard(type: PretendardType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.name, size: size) else { return UIFont.init() }
        
        return font
    }

    enum PretendardType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
        case semiBold = "semiBold"
        
        var name: String {
            return "Pretendard-" + self.rawValue
        }
    }
}
