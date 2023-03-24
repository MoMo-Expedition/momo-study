//
//  ViewController.swift
//  MVC-practice
//
//  Created by Noah Park on 2023/03/24.
//

import UIKit

final class LottoGeneratingViewController: UIViewController {
    
    let generator = LottoGenerator()
    var lottoBalls: [LottoBall] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        generator.generateLottoNumbers()
        let numbers = generator.getLottoNumbers()
        if let numbers {
            for idx in 0 ..< numbers.count {
                let newBall = LottoBall(number: numbers[idx])
                lottoBalls.append(newBall)
            }
        }
        
        (0..<lottoBalls.count).forEach { idx in
            let ball = lottoBalls[idx]
            self.view.addSubview(ball)
            ball.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                ball.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            ])
            
        }
    }
    


}

