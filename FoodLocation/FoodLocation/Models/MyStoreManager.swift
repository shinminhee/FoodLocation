//
//  MyStoreManager.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/19.
//

import Foundation
class MyStoreManager {
    
    static let shared = MyStoreManager()
    
    final var myStore: [String] = [ ]
    
    private init() {
        
    }
}
