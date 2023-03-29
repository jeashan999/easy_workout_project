//
//  ForgetController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja on 2023-03-12.
//

import UIKit

class ForgetController: UIViewController {

    private let headerview = AuthHeaderView(title: "Forget Password", subTitle: "Reset your password")
    private let emailFeild = TextFeildCustom(feildType: .email )
    private let resetPasswordBtn = CustomButton(title: "Reset Password", hasBackground: true, fontSize: .big)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false

    }
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerview)
        self.view.addSubview(emailFeild)
        self.view.addSubview(resetPasswordBtn)

        
        
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        emailFeild.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordBtn.translatesAutoresizingMaskIntoConstraints = false

        

        
        NSLayoutConstraint.activate([

            self.headerview.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerview.heightAnchor.constraint(equalToConstant: 222),
            
            self.emailFeild.topAnchor.constraint(equalTo: headerview.bottomAnchor, constant:  12),
            self.emailFeild.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.emailFeild.heightAnchor.constraint(equalToConstant: 55),
            self.emailFeild.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.resetPasswordBtn.topAnchor.constraint(equalTo: emailFeild.bottomAnchor, constant:  22),
            self.resetPasswordBtn.centerXAnchor.constraint(equalTo: emailFeild.centerXAnchor),
            self.resetPasswordBtn.heightAnchor.constraint(equalToConstant: 55),
            self.resetPasswordBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
        
        
    }

}
