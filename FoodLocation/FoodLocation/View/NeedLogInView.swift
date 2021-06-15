//
//  NeedLogInView.swift
//  FoodLocation
//
//  Created by 신민희 on 2021/04/22.
//

import UIKit

class NeedLogInView: UIView {
    
    let NeedLogInLabel = UILabel()
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setUI()

    }
    
    init(view: UIView) {
        super.init(frame: .zero) // == CGRect(x: 0, y: 0, w: 0, h: 0)
        let width: CGFloat = 200
        let height: CGFloat = 160
        self.layer.cornerRadius = 15
        self.frame = CGRect(x: view.frame.midX - width / 2, y: view.frame.midY - height / 2, width: width, height: height)
      
//        view.addSubview(NeedLogInLabel)
//        NeedLogInLabel.frame = CGRect(x: view.frame.midX, y: view.frame.midY, width: 100, height: 50)
//
//        NeedLogInLabel.backgroundColor = .blue
//        NeedLogInLabel.text = "로그인이 필요합니다."
//        NeedLogInLabel.textColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setUI() {
//        NeedLogInView(view: view).addSubview(NeedLogInLabel)
//        NeedLogInLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            NeedLogInLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            NeedLogInLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            NeedLogInLabel.widthAnchor.constraint(equalToConstant: 190),
//
//        ])
//        NeedLogInLabel.text = "로그인이 필요합니다."
//        NeedLogInLabel.textColor = .yellow
//    }

}
