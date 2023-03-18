//
//  TextFeildCustom.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-03-16.
//

import UIKit

class TextFeildCustom: UITextField {

    enum TextCustomFeildTypes {
        
        case username
        case email
        case password
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
            
        case .username:
            self.placeholder = "Username"
        case .email:
            self.placeholder = "Email Address"
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
