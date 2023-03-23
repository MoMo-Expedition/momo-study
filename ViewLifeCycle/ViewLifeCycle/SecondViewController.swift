//
//  SecondViewController.swift
//  ViewLifeCycle
//
//  Created by Noah Park on 2023/03/23.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("첫번째로 화면 전환", for: .normal)
        return button
    }()
    
    @objc func buttonPressed(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "first") as? ViewController else {return}
        self.present(nextVC, animated: true)
    }
    
    private func setButtonLayout() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.widthAnchor.constraint(equalToConstant: 200),
        ])
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
    }

    override func loadView() {
        super.loadView()
        print("load second View")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("second view did load")
        view.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setButtonLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("second view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("second view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("second view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("second view did disappear")
    }
}
