//
//  ImageCache.swift
//  CCR
//
//  Created by Amol Budhiraja on 12/12/20.
//  Copyright © 2020 Amol Budhiraja. All rights reserved.
//
import UIKit

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

struct TemporaryImageCache: ImageCache {
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    }
}

