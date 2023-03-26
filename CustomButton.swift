//
//  CustomButton.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-03-16.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        case big
        case med
        case small
    }
    init(title: String , hasBackground: Bool = false , fontSize: FontSize){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBackground ? .systemGreen : .clear
        let titleColor: UIColor = hasBackground ? .white : .systemBlue
        
        self.setTitleColor(titleColor , for: .normal)
        
        
        switch fontSize {
            
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
            
        case .med:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case.small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
