//
//  Test.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/22.
//

import Foundation

struct Resolution {
    var width = 0
    var height = 0

init(width: Int) {
    self.width = width
    }
}

class VideoMode {
    var resolution = Resolution(width: 2048)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    init(interlaced: Bool, frameRate: Double) {
        self.interlaced = interlaced
        self.frameRate = frameRate
    }
    let videoMode = VideoMode.init(interlaced: true, frameRate: 40.0)
    
}
