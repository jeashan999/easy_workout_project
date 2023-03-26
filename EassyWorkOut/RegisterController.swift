//
//  RegisterController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja on 2023-03-12.
//

import UIKit

class RegisterController: UIViewController {
    private let headerview = AuthHeaderView(title: "Sign Up", subTitle: "It's quick and easy.")
    private let Name = TextFeildCustom(feildType: .Name )
    private let useremail = TextFeildCustom(feildType: .email )
    private let userHeight = TextFeildCustom(feildType: .height )
    private let userWeight = TextFeildCustom(feildType: .weight )
    private let passwordFeild = TextFeildCustom(feildType: .password )
    private let dateOfBirth = TextFeildCustom(feildType: .dateOfbirth )
    private let age = TextFeildCustom(feildType: .age )
    
    let datepicker = UIDatePicker()
    
    private let userSignUp = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
    private let userLogin = CustomButton(title: "Already have a account ? Login", fontSize: .med)
    private let userPasswordForget = CustomButton(title: "Forget Password", fontSize: .small )
    
    private let scrollView = UIScrollView()
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
        self.userSignUp.addTarget(self, action: #selector(goToDashBoard), for: .touchUpInside)
        self.userLogin.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        self.userPasswordForget.addTarget(self, action: #selector(goToForgetPassword), for: .touchUpInside)
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    func createDatePicker(){
        // tool bar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // date picker mode
        self.datepicker.datePickerMode = .date
        self.datepicker.preferredDatePickerStyle = .wheels
        // bar done button
        let bardonebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(gotoDoneBtn))
        toolbar.setItems([bardonebtn], animated: true)
        // assgin toolbar
        dateOfBirth.inputAccessoryView = toolbar
        dateOfBirth.inputView = datepicker
        dateOfBirth.textAlignment = .left
    }
    

    private func setupUI() {
        
        self.view.addSubview(headerview)
        self.view.addSubview(Name)
        self.view.addSubview(dateOfBirth)
        self.view.addSubview(userHeight)
        self.view.addSubview(userWeight)
        self.view.addSubview(useremail)
        self.view.addSubview(age)
        self.view.addSubview(passwordFeild)
        self.view.addSubview(userLogin)
        self.view.addSubview(userSignUp)
        self.view.addSubview(userPasswordForget)
        
        
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        Name.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirth.translatesAutoresizingMaskIntoConstraints = false
        userHeight.translatesAutoresizingMaskIntoConstraints = false
        userWeight.translatesAutoresizingMaskIntoConstraints = false
        age.translatesAutoresizingMaskIntoConstraints = false
        useremail.translatesAutoresizingMaskIntoConstraints = false
        passwordFeild.translatesAutoresizingMaskIntoConstraints = false
      
        userLogin.translatesAutoresizingMaskIntoConstraints = false
        userSignUp.translatesAutoresizingMaskIntoConstraints = false
        
//        view.insertSubview(imageView, at: 0)
        
        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.headerview.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerview.heightAnchor.constraint(equalToConstant: 220),
           
            self.Name.topAnchor.constraint(equalTo: headerview.bottomAnchor, constant:  10),
            self.Name.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.Name.heightAnchor.constraint(equalToConstant: 40),
            self.Name.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
     
            self.dateOfBirth.topAnchor.constraint(equalTo: Name.bottomAnchor, constant:  10),
            self.dateOfBirth.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.dateOfBirth.heightAnchor.constraint(equalToConstant: 40),
            self.dateOfBirth.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.userHeight.topAnchor.constraint(equalTo: dateOfBirth.bottomAnchor, constant:  10),
            self.userHeight.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.userHeight.heightAnchor.constraint(equalToConstant: 40),
            self.userHeight.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.userWeight.topAnchor.constraint(equalTo: userHeight.bottomAnchor, constant:  10),
            self.userWeight.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.userWeight.heightAnchor.constraint(equalToConstant: 40),
            self.userWeight.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.useremail.topAnchor.constraint(equalTo: userWeight.bottomAnchor, constant:  25),
            self.useremail.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.useremail.heightAnchor.constraint(equalToConstant: 40),
            self.useremail.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordFeild.topAnchor.constraint(equalTo: useremail.bottomAnchor, constant:  12),
            self.passwordFeild.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.passwordFeild.heightAnchor.constraint(equalToConstant: 40),
            self.passwordFeild.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
         
            
            self.userSignUp.topAnchor.constraint(equalTo: passwordFeild.bottomAnchor, constant:  22),
            self.userSignUp.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.userSignUp.heightAnchor.constraint(equalToConstant: 40),
            self.userSignUp.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.userLogin.topAnchor.constraint(equalTo: userSignUp.bottomAnchor, constant: 10),
            self.userLogin.centerXAnchor.constraint(equalTo: headerview.centerXAnchor),
            self.userLogin.heightAnchor.constraint(equalToConstant: 30),
            self.userLogin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            

            
 ])
        
        
    }
    
    // Selectors
    @objc private func goToDashBoard(){
        print("goToDashBoard")
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false , completion: nil)
    }
    @objc private func goToLogin(){
        print("goToLogin")
        let vc = LoginController()
//        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func goToForgetPassword(){
        print("goToForgetPassword")
        let vc = ForgetController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func gotoDoneBtn(){
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.timeStyle = .none
        dateFormater.dateFormat = "MM/dd/yyyy"
        dateOfBirth.text = dateFormater.string(from: datepicker.date)
        let date = dateFormater.string(from: datepicker.date)
        let dateOfBirth = dateFormater.date(from: date)

           let calender = Calendar.current

           let dateComponent = calender.dateComponents([.year, .month, .day], from:
           dateOfBirth!, to: Date())
        let x = dateComponent.year!
        let str = String(x)
        age.text = str+" "+"y"
        self.view.endEditing(true)
    }

}
