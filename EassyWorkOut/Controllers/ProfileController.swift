//
//  ProfileController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-14.
//

import UIKit

class ProfileController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let saveChangesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save Changes", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(saveChangesButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Height"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter height"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Weight"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter weight"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Age"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter age"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let changePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Password", for: .normal)
        button.addTarget(self, action: #selector(changePasswordButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "My Account"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)]
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(nameTextField)
        containerView.addSubview(heightLabel)
        containerView.addSubview(heightTextField)
        containerView.addSubview(weightLabel)
        containerView.addSubview(weightTextField)
        containerView.addSubview(ageLabel)
        containerView.addSubview(ageTextField)
        containerView.addSubview(changePasswordButton)
        containerView.addSubview(saveChangesButton)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            heightLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            heightLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            heightLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            heightLabel.heightAnchor.constraint(equalToConstant: 20),
            
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 8),
            heightTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            heightTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            heightTextField.heightAnchor.constraint(equalToConstant: 40),
            
            weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 16),
            weightLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            weightLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            weightLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 8),
            weightTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            weightTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            weightTextField.heightAnchor.constraint(equalToConstant: 40),
            
            ageLabel.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 16),
            ageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            ageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            ageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 8),
            ageTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            ageTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            ageTextField.heightAnchor.constraint(equalToConstant: 40),
            
            changePasswordButton.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 32),
            changePasswordButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            changePasswordButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 50),
            
            saveChangesButton.topAnchor.constraint(equalTo: changePasswordButton.bottomAnchor, constant: 32),
            saveChangesButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            saveChangesButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            saveChangesButton.heightAnchor.constraint(equalToConstant: 50),
            saveChangesButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func changePasswordButtonTapped() {
        let alertController = UIAlertController(title: "Change Password", message: "Enter a new password", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Old Password"
            textField.isSecureTextEntry = true
        }
        alertController.addTextField { textField in
            textField.placeholder = "New Password"
            textField.isSecureTextEntry = true
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] _ in
            guard let newPassword = alertController.textFields?.first?.text else {
                return
            }
            
            // TODO: Perform password update logic with newPassword
            
            // Dismiss the view controller after password change
            self?.navigationController?.popViewController(animated: true)
        }))
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func saveChangesButtonTapped() {
        // Save profile changes
        // Fetch the updated values from the text fields
        
        let name = nameTextField.text ?? ""
        // Fetch values from other fields (height, weight, age)
        
        // Perform profile update logic with the new values
        
        // Display a success message or handle errors
        
        // Dismiss the view controller
        navigationController?.popViewController(animated: true)
    }
}
