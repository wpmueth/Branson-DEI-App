//
//  Fonts.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/2/23.
//

import SwiftUI

extension Font {
    public static func ubuntuRegular(size: CGFloat) -> Font {
        return Font.custom("Ubuntu", size: size)
    }

    public static func ubuntuMedium(size: CGFloat) -> Font {
        return Font.custom("Ubuntu-Medium", size: size)
    }

    public static func ubuntuBold(size: CGFloat) -> Font {
        return Font.custom("Ubuntu-Bold", size: size)
    }
}
