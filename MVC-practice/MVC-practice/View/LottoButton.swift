//
//  LottoButton.swift
//  MVC-practice
//
//  Created by Noah Park on 2023/03/24.
//

import UIKit


final class LottoButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .green
        self.layer.cornerRadius = 20.0
        self.setTitle("Lotto 번호 생성", for: .normal)
        self.setTitleColor(.white, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
