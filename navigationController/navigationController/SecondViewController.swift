//
//  SecondViewController.swift
//  navigationController
//
//  Created by Noah Park on 2023/04/03.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = .lightGray
        
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
        navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
