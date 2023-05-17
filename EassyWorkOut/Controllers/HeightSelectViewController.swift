//
//  HeightSelectViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-17.
//

import UIKit

class HeightSelectViewController: UIViewController {

    private let headerview = AuthHeaderView(title: "Select Your Height", subTitle: "Choose your height")
    private let heightSlider = UISlider()
    private let heightProgressView = UIProgressView()
    private let heightLabel = UILabel()
    private let confirmButton = CustomButton(title: "Next", hasBackground: true, fontSize: .big)
    
    private let heightRange = 1...1000 // Range of weight values
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        heightSlider.addTarget(self, action: #selector(weightSliderValueChanged), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerview)
        view.addSubview(heightSlider)
        view.addSubview(heightProgressView)
        view.addSubview(heightLabel)
        view.addSubview(confirmButton)
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        heightSlider.translatesAutoresizingMaskIntoConstraints = false
        heightProgressView.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerview.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerview.heightAnchor.constraint(equalToConstant: 222),
            
            heightSlider.topAnchor.constraint(equalTo: headerview.bottomAnchor, constant: 12),
            heightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heightSlider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            heightProgressView.topAnchor.constraint(equalTo: heightSlider.bottomAnchor, constant: 8),
            heightProgressView.leadingAnchor.constraint(equalTo: heightSlider.leadingAnchor),
            heightProgressView.trailingAnchor.constraint(equalTo: heightSlider.trailingAnchor),
            
            heightLabel.topAnchor.constraint(equalTo: heightProgressView.bottomAnchor, constant: 8),
            heightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            confirmButton.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 22),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            confirmButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        // Customize the appearance of the progress view
        heightProgressView.progressTintColor = .green
        heightProgressView.trackTintColor = .lightGray
        heightProgressView.progress = 0.0
        
        // Set the range and initial value of the slider
        heightSlider.minimumValue = Float(heightRange.lowerBound)
        heightSlider.maximumValue = Float(heightRange.upperBound)
        heightSlider.value = Float(heightRange.lowerBound)
        
        // Set up the weight label
        heightLabel.font = UIFont.systemFont(ofSize: 18)
        heightLabel.textColor = .label
        heightLabel.textAlignment = .center
        updateWeightLabel()
    }
    
    @objc private func confirmButtonTapped() {
        let selectedHeight = Int(heightSlider.value)
        print("Selected Weight: \(selectedHeight)")
        let nextViewController = RegisterController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
        // Perform further actions with the selected weight
    }
    
    @objc private func weightSliderValueChanged() {
        let selectedWeight = Int(heightSlider.value)
        let progress = Float(selectedWeight - heightRange.lowerBound) / Float(heightRange.upperBound - heightRange.lowerBound)
        heightProgressView.progress = progress
        updateWeightLabel()
    }
    
    private func updateWeightLabel() {
        let selectedHeight = Int(heightSlider.value)
        heightLabel.text = "\(selectedHeight) Cm"
    }
}
