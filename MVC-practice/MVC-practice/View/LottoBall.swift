//
//  LottoBall.swift
//  MVC-practice
//
//  Created by Noah Park on 2023/03/24.
//

import UIKit

final class LottoBall: UIView {
    
    let label = UILabel()
    let number: Int
    
    init(number: Int) {
        self.number = number
        super.init(frame: .zero)
        label.text = String(number)
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        label.font = .systemFont(ofSize: 16, weight: .bold)
        let r = CGFloat.random(in: 0...255)
        let g = CGFloat.random(in: 0...255)
        let b = CGFloat.random(in: 0...255)
        
        self.backgroundColor = UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
        label.textColor = UIColor.init(red: 255 - r, green: 255 - g, blue: 255 - b, alpha: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
