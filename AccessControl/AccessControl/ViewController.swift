//
//  ViewController.swift
//  AccessControl
//
//  Created by Noah Park on 2023/03/28.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {

    let someView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        someView.backgroundColor = .blue
        
        view.addSubview(someView)
        someView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
            make.leading.relatedTo
        }
        
        
        
        
    }


}

