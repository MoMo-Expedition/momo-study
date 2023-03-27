//
//  ViewController.swift
//  MVC-practice
//
//  Created by Noah Park on 2023/03/24.
//

import UIKit

final class LottoGeneratingViewController: UIViewController {
    
    let generator = LottoGenerator()
    var lottoBalls: [LottoBallView] = []
    var lottoButton = LottoButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        generator.generateLottoNumbers()
        createBallsWithNumbers()
        setBallsLayout()
        self.view.layoutIfNeeded()
        setBallsCircle()
        
        view.addSubview(lottoButton)
        setButtonLayoutAndAction()
    }
    
    private func setButtonLayoutAndAction() {
        lottoButton.frame.size = CGSize(width: 300, height: 50)
        lottoButton.center = CGPoint(x: view.center.x, y: view.center.y + 250)
        lottoButton.addTarget(self, action: #selector(lottoButtonPressed), for: .touchUpInside)
    }
    
    private func createBallsWithNumbers() {
        let numbers = generator.getLottoNumbers()
        if let numbers {
            for idx in 0 ..< numbers.count {
                let newBall = LottoBallView(number: numbers[idx])
                lottoBalls.append(newBall)
            }
        }
    }
    
    private func setBallsCircle() {
        (0..<lottoBalls.count).forEach { idx in
            let ball = lottoBalls[idx]
            ball.layer.cornerRadius = ball.bounds.width / 2
        }
    }
    
    private func setBallsLayout() {
        (0..<lottoBalls.count).forEach { idx in
            let ball = lottoBalls[idx]
            self.view.addSubview(ball)
            ball.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                ball.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                ball.heightAnchor.constraint(equalTo: ball.widthAnchor),
            ])
            
            if idx == 0 {
                NSLayoutConstraint.activate([
                    ball.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
                ])
            } else if idx < lottoBalls.count - 1 {
                let previousBall = lottoBalls[idx - 1]
                NSLayoutConstraint.activate([
                    ball.leadingAnchor.constraint(equalTo: previousBall.trailingAnchor, constant: 10),
                    ball.widthAnchor.constraint(equalTo: previousBall.widthAnchor)
                ])
            } else {
                let previousBall = lottoBalls[idx - 1]
                NSLayoutConstraint.activate([
                    ball.leadingAnchor.constraint(equalTo: previousBall.trailingAnchor, constant: 10),
                    ball.widthAnchor.constraint(equalTo: previousBall.widthAnchor),
                    ball.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
                ])
            }
        }
    }
    
    @objc func lottoButtonPressed(_ sender: LottoButton) {
        removeBallFromView()
        lottoBalls.removeAll()
        generator.generateLottoNumbers()
        createBallsWithNumbers()
        setBallsLayout()
        self.view.layoutIfNeeded()
        setBallsCircle()
    }
    
    private func removeBallFromView() {
        lottoBalls.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func changeNumbers() {
        generator.generateLottoNumbers()
    }

}

