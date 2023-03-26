//
//  LoginController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja on 2023-03-12.
//

import UIKit

class LoginController: UIViewController {

    
    private let headerview = AuthHeaderView(title: "Sign In", subTitle: "Sign in to Easy Workout")
    private let usernameFeild = TextFeildCustom(feildType: .email )
    private let passwordFeild = TextFeildCustom(feildType: .password )
    
    private let userLogin = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    private let userAccountCreate = CustomButton(title: "New to EasyWorkout? Create an account.", fontSize: .small)
    private let userPasswordForget = CustomButton(title: "Forget Password?", fontSize: .small )
    private let userPrivacyPolicy = CustomButton(title: "Privacy & Policy",fontSize: .med )
//    var imageView: UIImageView = {
//        let imageView = UIImageView(frame: .zero)
//        imageView.image = UIImage(named: "background")
//        imageView.contentMode = .scaleToFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupUI()
        self.userLogin.addTarget(self, action: #selector(goToDashBoard), for: .touchUpInside)
        self.userAccountCreate.addTarget(self, action: #selector(goToCreateAccount), for: .touchUpInside)
        self.userPasswordForget.addTarget(self, action: #selector(goToForgetPassword), for: .touchUpInside)
        self.userPrivacyPolicy.addTarget(self, action: #selector(goToPrivacy), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
//        self.goToCreateAccount()
    }

    private func setupUI() {
        
        self.view.addSubview(headerview)
        self.view.addSubview(usernameFeild)
        self.view.addSubview(passwordFeild)
        self.view.addSubview(userLogin)
        self.view.addSubview(userAccountCreate)
        self.view.addSubview(userPasswordForget)
        self.view.addSubview(userPrivacyPolicy)
        
        
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        usernameFeild.translatesAutoresizingMaskIntoConstraints = false
        passwordFeild.translatesAutoresizingMaskIntoConstraints = false
      
        userLogin.translatesAutoresizingMaskIntoConstraints = false
        userAccountCreate.translatesAutoresizingMaskIntoConstraints = false
        userPasswordForget.translatesAutoresizingMaskIntoConstraints = false
        userPrivacyPolicy.translatesAutoresizingMaskIntoConstraints = false
        
//        view.insertSubview(imageView, at: 0)
        
        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.headerview.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerview.heightAnchor.constraint(equalToConstant: 222),
           
            self.usernameFeild.topAnchor.constraint(equalTo: headerview.bottomAnchor, constant:  12),
            self.usernameFeild.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.usernameFeild.heightAnchor.constraint(equalToConstant: 55),
            self.usernameFeild.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            

            
            self.passwordFeild.topAnchor.constraint(equalTo: usernameFeild.bottomAnchor, constant:  22),
            self.passwordFeild.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.passwordFeild.heightAnchor.constraint(equalToConstant: 55),
            self.passwordFeild.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.userLogin.topAnchor.constraint(equalTo: passwordFeild.bottomAnchor, constant:  22),
            self.userLogin.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.userLogin.heightAnchor.constraint(equalToConstant: 55),
            self.userLogin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.userAccountCreate.topAnchor.constraint(equalTo: userLogin.bottomAnchor, constant:  11),
            self.userAccountCreate.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.userAccountCreate.heightAnchor.constraint(equalToConstant: 40),
            self.userAccountCreate.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.userPasswordForget.topAnchor.constraint(equalTo: userAccountCreate.bottomAnchor, constant:  5),
            self.userPasswordForget.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.userPasswordForget.heightAnchor.constraint(equalToConstant: 20),
            self.userPasswordForget.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.userPrivacyPolicy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            self.userPrivacyPolicy.trailingAnchor.constraint(equalTo: userPrivacyPolicy.trailingAnchor, constant: -20),
            self.userPrivacyPolicy.centerYAnchor.constraint(equalTo: userPrivacyPolicy.centerYAnchor)
            
 ])
        
        
    }
    
    // Selectors
    @objc private func goToDashBoard(){
        print("goToDashBoard")
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false , completion: nil)
    }
    @objc private func goToCreateAccount(){
        print("goToCreateAccount")
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func goToForgetPassword(){
        print("goToForgetPassword")
       let vc = ForgetController()
       self.navigationController?.pushViewController(vc, animated: true)

    }
    @objc private func goToPrivacy(){
        print("gotoPrivacy")
       let vc = WebViewerController()
       self.navigationController?.pushViewController(vc, animated: true)

    }

}
