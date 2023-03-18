//
//  AuthHeaderView.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-03-15.
//

import UIKit

class AuthHeaderView: UIView {

    private let logoimageView: UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFit
        imgview.image = UIImage(named: "logo")
        imgview.tintColor = .white
        return imgview
    }()
    
    private let labelTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 26 , weight: .bold)
        lbl.text = "Error"
         return lbl
        
    }()
    
    private let labelSubTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 16 , weight: .regular)
        lbl.text = "Error"
         return lbl
        
    }()
    
    init(title: String , subTitle: String){
        super.init(frame: .zero)
        self.labelTitle.text = title
        self.labelSubTitle.text = subTitle
        
        self.setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.addSubview(logoimageView)
        self.addSubview(labelTitle)
        self.addSubview(labelSubTitle)
        
        logoimageView.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelSubTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.logoimageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor , constant: 30),
            self.logoimageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoimageView.widthAnchor.constraint(equalToConstant: 90),
            self.logoimageView.heightAnchor.constraint(equalTo: logoimageView.widthAnchor),
            
            self.labelTitle.topAnchor.constraint(equalTo: logoimageView.bottomAnchor, constant: 19),
            self.labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.labelSubTitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 12),
            self.labelSubTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.labelSubTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        ])
        
    }
    
}
