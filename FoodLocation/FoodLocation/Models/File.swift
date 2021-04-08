//
//  File.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/08.
//

import Foundation
import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {
   let tapGestureRecognizer = UITapGestureRecognizer()
    var sectionIndex = 0
    var delegate: HeaderViewDelegate?
    var sectionNumber: Int = 0
   
   override func draw(_ rect: CGRect) {
       super.draw(rect)
       contentView.addGestureRecognizer(tapGestureRecognizer)
       tapGestureRecognizer.addTarget(self, action: #selector(didSelectSection))
   }
   
    @objc func didSelectSection() {
           delegate?.didTouchSection(self.sectionNumber)
       }
}
