//
//  FitnessGoalCardView.swift
//  EassyWorkOut
//
//  Created by neat lanka  on 2023-05-17.
//

import UIKit

class FitnessGoalCardView: UIView {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Select", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    private let highlightedColor: UIColor = .systemBlue
    
    var navigationHandler: (() -> Void)?
    
    // MARK: - Initialization
    
    init(title: String, subtitle: String, imageName: String) {
        super.init(frame: .zero)
        
        setupUI()
        configure(with: title, subtitle: subtitle, imageName: imageName)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.clear.cgColor
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(imageView)
        addSubview(button)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            button.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configure(with title: String, subtitle: String, imageName: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = UIImage(named: imageName)
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        navigationHandler?()
    }
    
    // MARK: - Public Methods
    
    func setHighlighted(_ highlighted: Bool) {
        layer.borderColor = highlighted ? highlightedColor.cgColor : UIColor.clear.cgColor
    }
}

