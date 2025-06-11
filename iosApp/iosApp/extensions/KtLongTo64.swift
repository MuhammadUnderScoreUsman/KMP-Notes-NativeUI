//
//  KtLongTo64.swift
//  iosApp
//
//  Created by Muhammad Usman on 10/06/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import shared

extension KotlinLong {
    func to64() -> Int64 {
        return Int64(self)
    }
}

extension Bool {
    func toKtBool() -> KotlinBoolean {
        return KotlinBoolean(value: self)
    }
}
