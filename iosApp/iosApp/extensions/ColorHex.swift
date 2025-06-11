//
//  ColorHex.swift
//  iosApp
//
//  Created by Muhammad Usman on 04/06/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    func toHex() -> String {
            // Convert SwiftUI Color to UIColor
            let uiColor = UIColor(self)
            
            // Get the components (red, green, blue, alpha)
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            // Convert to 0-255 range
            let r = Int(red * 255)
            let g = Int(green * 255)
            let b = Int(blue * 255)
            let a = Int(alpha * 255)
            
            // Format as 0xaarrggbb
            return String(format: "0x%02x%02x%02x%02x", a, r, g, b)
        }
}
