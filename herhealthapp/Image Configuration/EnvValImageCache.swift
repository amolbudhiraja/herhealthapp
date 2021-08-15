//
//  EnvValImageCache.swift
//  CCR
//
//  Created by Amol Budhiraja on 12/12/20.
//  Copyright © 2020 Amol Budhiraja. All rights reserved.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}

