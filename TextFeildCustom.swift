//
//  TextFeildCustom.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-03-16.
//

import UIKit

class TextFeildCustom: UITextField {

    enum TextCustomFeildTypes {
        
        case userFname
        case userLname
        case Name
        case dateOfbirth
        case email
        case password
        case age
        case height
        case weight
        case fitnessGoal
    }

    private let authFeildType: TextCustomFeildTypes
    
    init(feildType: TextCustomFeildTypes) {
        self.authFeildType = feildType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch feildType {
            
        case .userFname:
            self.placeholder = "First Name"
        case .Name:
            self.placeholder = "Your Name"
        case .userLname:
            self.placeholder = "Last Name"
        case .dateOfbirth:
            self.placeholder = "Date of birth"
        case .fitnessGoal:
            self.placeholder = "Fitness goal"
        case .age:
            self.placeholder = "Age"
            self.isEnabled   = false
            self.isHidden = true
        case .height:
            self.placeholder = "Height (Kg)"
        case .weight:
            self.placeholder = "Weight (cm)"
        case .email:
            self.placeholder = "Email address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry =  true
        
        
        }
        
    }
    required init?(coder: NSCoder) {
       fatalError("init (coder)  has not been implemented")
    }
}
