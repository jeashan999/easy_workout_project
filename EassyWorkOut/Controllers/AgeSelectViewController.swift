//
//  AgeSelectViewController.swift
//  EassyWorkOut
//
//  Created by  jeashan anuja  on 2023-05-17.
//

import UIKit



class AgeSelectViewController: UIViewController {

    private let headerview = AuthHeaderView(title: "Select Your Age", subTitle: "Choose your age")
    private let agePicker = UIPickerView()
    private let confirmButton = CustomButton(title: "Next", hasBackground: true, fontSize: .big)
    
    private let ages = Array(1...100) // Array of ages from 1 to 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        agePicker.dataSource = self
        agePicker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerview)
        view.addSubview(agePicker)
        view.addSubview(confirmButton)
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        agePicker.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerview.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerview.heightAnchor.constraint(equalToConstant: 222),
            
            agePicker.topAnchor.constraint(equalTo: headerview.bottomAnchor, constant: 12),
            agePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            agePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            agePicker.heightAnchor.constraint(equalToConstant: 216),
            
            confirmButton.topAnchor.constraint(equalTo: agePicker.bottomAnchor, constant: 22),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            confirmButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
    
    @objc private func confirmButtonTapped() {
        let selectedAge = ages[agePicker.selectedRow(inComponent: 0)]
        print("Selected Age: \(selectedAge)")
        // Perform further actions with the selected age
        let nextViewController = WeightSelectViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension AgeSelectViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // We only have 1 component (age)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ages.count // Number of rows in the age component
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(ages[row])" // Title for each row in the age component
    }
}



