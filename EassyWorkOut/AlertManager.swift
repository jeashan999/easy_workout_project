//
//  AlertManager.swift
//  EassyWorkOut
//
//  Created by Jeashan anuja  on 2023-04-02.
//

import UIKit

class AlertManager {
    
    private static func showAlertBasic(on vc: UIViewController , titile: String,  message: String?){
        
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: titile, message: message, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default , handler: nil))
            vc.present(alert, animated: true)
        }
    }
}

extension AlertManager {
    
    public static func showEmailvalidationAlert(on vc:UIViewController){
        self.showAlertBasic(on: vc, titile: "Email address invalid", message: "Please enter valid email.")
    }
    public static func showPasswordvalidationAlert(on vc:UIViewController){
        self.showAlertBasic(on: vc, titile: "Invalid Password", message: "Please enter valid password.")
    }
  
}
extension AlertManager {
   
    public static func showRigistraionErrorsAlert(on vc:UIViewController){
        self.showAlertBasic(on: vc, titile: "Unknown Registarion Error", message: nil)
    }
    
    public static func showRigistraionErrorsAlert(on vc:UIViewController , with error:Error){
        self.showAlertBasic(on: vc, titile: "Unknown Registarion Error", message: "\(error.localizedDescription)")
    }
  
}
