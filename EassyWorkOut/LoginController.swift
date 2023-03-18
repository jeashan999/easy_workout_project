//
//  LoginController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja on 2023-03-12.
//

import UIKit

class LoginController: UIViewController {

    
    private let headerview = AuthHeaderView(title: "Sign In", subTitle: "Login to your account")
    private let usernameFeild = TextFeildCustom(feildType: .username )
    private let passwordFeild = TextFeildCustom(feildType: .password )
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    private func setupUI() {
        
        self.view.addSubview(headerview)
        self.view.addSubview(usernameFeild)
        self.view.addSubview(passwordFeild)
        
        
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        usernameFeild.translatesAutoresizingMaskIntoConstraints = false
        passwordFeild.translatesAutoresizingMaskIntoConstraints = false
      
        view.insertSubview(imageView, at: 0)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.headerview.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerview.heightAnchor.constraint(equalToConstant: 222),
           
            self.usernameFeild.topAnchor.constraint(equalTo: headerview.bottomAnchor, constant:  12),
            self.usernameFeild.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.usernameFeild.heightAnchor.constraint(equalToConstant: 55),
            self.usernameFeild.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            

            
            self.passwordFeild.topAnchor.constraint(equalTo: usernameFeild.bottomAnchor, constant:  22),
            self.passwordFeild.centerXAnchor.constraint(equalTo: usernameFeild.centerXAnchor),
            self.passwordFeild.heightAnchor.constraint(equalToConstant: 55),
            self.passwordFeild.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        
        ])
        
        
    }

}
