//
//  SearchView.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/03/25.
//

import UIKit

class CustomView: UIView {
    
    let searchViewImage = UIImageView()
    let searchViewLabel = UILabel()
    let searchViewBackImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
    }
    
    init(view: UIView) {
        super.init(frame: .zero) // == CGRect(x: 0, y: 0, w: 0, h: 0)
        let width: CGFloat = 300
        let height: CGFloat = 50
        self.frame = CGRect(x: view.frame.midX - width / 2, y: view.frame.midY - 100, width: width, height: height)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
