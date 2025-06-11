//
//  FromHex.swift
//  iosApp
//
//  Created by Muhammad Usman on 04/06/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import SwiftUI

extension String{
    func colorFromHex() -> Color {
            var hexString = self.trimmingCharacters(in: .whitespacesAndNewlines)
            hexString = hexString.replacingOccurrences(of: "0x", with: "")
            
            // Convert to UIColor first for easier handling
            var rgbValue: UInt64 = 0
            Scanner(string: hexString).scanHexInt64(&rgbValue)
            
            let a = CGFloat((rgbValue >> 24) & 0xFF) / 255.0
            let r = CGFloat((rgbValue >> 16) & 0xFF) / 255.0
            let g = CGFloat((rgbValue >> 8) & 0xFF) / 255.0
            let b = CGFloat(rgbValue & 0xFF) / 255.0
            
            return Color(UIColor(red: r, green: g, blue: b, alpha: a))
        }
}
