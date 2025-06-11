//
//  64ToLong.swift
//  iosApp
//
//  Created by Muhammad Usman on 04/06/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import shared

extension Int64 {
    func toKtLong() -> KotlinLong {
        return KotlinLong(value:self)
    }
}
