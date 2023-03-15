//
//  LoginController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja on 2023-03-12.
//

import UIKit

class LoginController: UIViewController {

    
    private let headerview = AuthHeaderView(title: "Sign In", subTitle: "Login to your account")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    

    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerview)
        
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
      
        
        
        NSLayoutConstraint.activate([
            self.headerview.topAnchor.constraint(equalTo: self.view.topAnchor , constant: 16),
            self.headerview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerview.heightAnchor.constraint(equalToConstant: 270),
           
            
            
        
        ])
        
    }

}
