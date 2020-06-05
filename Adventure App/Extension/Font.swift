//
//  Font.swift
//  Adventure App
//
//  Created by edwin on 06/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

enum DynamicType: String {
    case Body = "UIFontTextStyleBody"
    case Headline = "UIFontTextStyleHeadline"
    case Subheadline = "UIFontTextStyleSubheadline"
    case Footnote = "UIFontTextStyleFootnote"
    case Caption1 = "UIFontTextStyleCaption1"
    case Caption2 = "UIFontTextStyleCaption2"
}
enum FontBook: String {
    case Regular = "TTNorms-Regular"
    case Light = "TTNorms-Light"
    case Medium = "TTNorms-Medium"
    case Bold = "TTNorms-Bold"
    
    
    func of(style: DynamicType) -> UIFont {
        let preferred = UIFont.preferredFont(forTextStyle: UIFont.TextStyle(rawValue: style.rawValue)).pointSize
        return UIFont(name: self.rawValue, size: preferred)!
    }
}

extension UIFont {
    class func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "TTNorms-Regular", size: size)!
    }
    class func light(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "TTNorms-Light", size: size)!
    }
    class func medium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "TTNorms-Medium", size: size)!
    }
    class func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "TTNorms-Bold", size: size)!
    }
}
