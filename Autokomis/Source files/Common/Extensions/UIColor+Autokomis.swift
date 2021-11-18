//
//  UIColor+Autokomis.swift
//  Autokomis
//
//  Created by Dominik Buraczewski on 08/08/2021.
//

import UIKit

extension UIColor {
    
    enum AppColor {
        case main
        case title
        case background
        case white
        case shadow
        case quality
        case custom(color: ThemeColor)
    }

    static func app(_ color: AppColor) -> UIColor {
        switch color {
        case .main:
            return custom(.mainDarkBlue)
        case .title:
            return custom(.mainDarkBlue)
        case .background:
            return custom(.gray1)
        case .white:
            return custom(.gray0)
        case .shadow:
            return custom(.black).withAlphaComponent(0.08)
        case .quality:
            return custom(.gold)
        case let .custom(color):
            return custom(color)
        }
    }

    enum ThemeColor {
        case mainDarkBlue
        case mainBlue
        case mainDarkRed
        case gold
        case gray0
        case gray1
        case gray2
        case gray3
        case gray4
        case gray5
        case gray6
        case gray7
        case gray8
        case gray9
        case black
    }

    static func custom(_ color: ThemeColor) -> UIColor {
        switch color {
        case .mainDarkBlue: return #colorLiteral(red: 0.0862745098, green: 0.1411764706, blue: 0.3215686275, alpha: 1) // 22 36 82
        case .mainBlue: return #colorLiteral(red: 0.1764705882, green: 0.4431372549, blue: 0.7803921569, alpha: 1) // 45 113 199
        case .mainDarkRed: return #colorLiteral(red: 0.7215686275, green: 0.2196078431, blue: 0.1411764706, alpha: 1) // 184 56 36
        case .gold: return #colorLiteral(red: 0.831372549, green: 0.6862745098, blue: 0.2156862745, alpha: 1) // 212 175 55
        case .gray0: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // 0xFFFFFF  255 255 255
        case .gray1: return #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1) // 0xF5F5F5  245 245 245
        case .gray2: return #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1) // 0xEFEFEF  239 239 239
        case .gray3: return #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1) // 0xE6E6E6  230 230 230
        case .gray4: return #colorLiteral(red: 0.8431372549, green: 0.8431372549, blue: 0.8431372549, alpha: 1) // 0xD7D7D7  215 215 215
        case .gray5: return #colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1) // 0xAFAFAF  175 175 175
        case .gray6: return #colorLiteral(red: 0.537254902, green: 0.537254902, blue: 0.537254902, alpha: 1) // 0x898989  137 137 137
        case .gray7: return #colorLiteral(red: 0.3921568627, green: 0.3921568627, blue: 0.3921568627, alpha: 1) // 0x646464  100 100 100
        case .gray8: return #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1) // 0x4A4A4A  074 074 074
        case .gray9: return #colorLiteral(red: 0.1215686275, green: 0.1215686275, blue: 0.1215686275, alpha: 1) // 0x1F1F1F 031 031 031
        case .black: return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // 0x000000 000 000 000
        }
    }
}
