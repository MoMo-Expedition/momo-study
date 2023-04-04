//
//  ViewController.swift
//  navigationController
//
//  Created by Noah Park on 2023/04/03.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .gray
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        button.layer.cornerRadius = 10
        button.backgroundColor = .green
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        someBehavior()
    }


    func someBehavior() {
        if let navigationController = navigationController {
            navigationController.pushViewController(SecondViewController(), animated: true)
        } else {
            print("navigationController not exist")
        }
    }
}

