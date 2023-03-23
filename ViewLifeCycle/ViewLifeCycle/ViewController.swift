//
//  ViewController.swift
//  ViewLifeCycle
//
//  Created by Noah Park on 2023/03/23.
//

import UIKit

final class ViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("두번째로 화면 전환", for: .normal)
        return button
    }()
    
    @objc func buttonPressed(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "second") as? SecondViewController else {return}
        self.present(nextVC, animated: true)
    }
    
    private func setButtonLayout() {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 30),
        ])
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
    }
    
    override func loadView() {
        super.loadView()
        print("load first View")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("first view did load")
        view.backgroundColor = .white
        setButtonLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("first view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("first view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("first view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("first view did disappear")
    }

}

