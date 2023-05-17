//
//  WeightSelectViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-17.
//

import UIKit

class WeightSelectViewController: UIViewController {

    private let headerview = AuthHeaderView(title: "Select Your Weight", subTitle: "Choose your weight")
    private let weightSlider = UISlider()
    private let weightProgressView = UIProgressView()
    private let weightLabel = UILabel()
    private let confirmButton = CustomButton(title: "Next", hasBackground: true, fontSize: .big)
    
    private let weightRange = 1...1000 // Range of weight values
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        weightSlider.addTarget(self, action: #selector(weightSliderValueChanged), for: .valueChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerview)
        view.addSubview(weightSlider)
        view.addSubview(weightProgressView)
        view.addSubview(weightLabel)
        view.addSubview(confirmButton)
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        weightSlider.translatesAutoresizingMaskIntoConstraints = false
        weightProgressView.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerview.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerview.heightAnchor.constraint(equalToConstant: 222),
            
            weightSlider.topAnchor.constraint(equalTo: headerview.bottomAnchor, constant: 12),
            weightSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightSlider.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            weightProgressView.topAnchor.constraint(equalTo: weightSlider.bottomAnchor, constant: 8),
            weightProgressView.leadingAnchor.constraint(equalTo: weightSlider.leadingAnchor),
            weightProgressView.trailingAnchor.constraint(equalTo: weightSlider.trailingAnchor),
            
            weightLabel.topAnchor.constraint(equalTo: weightProgressView.bottomAnchor, constant: 8),
            weightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            confirmButton.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 22),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            confirmButton.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        // Customize the appearance of the progress view
        weightProgressView.progressTintColor = .green
        weightProgressView.trackTintColor = .lightGray
        weightProgressView.progress = 0.0
        
        // Set the range and initial value of the slider
        weightSlider.minimumValue = Float(weightRange.lowerBound)
        weightSlider.maximumValue = Float(weightRange.upperBound)
        weightSlider.value = Float(weightRange.lowerBound)
        
        // Set up the weight label
        weightLabel.font = UIFont.systemFont(ofSize: 18)
        weightLabel.textColor = .label
        weightLabel.textAlignment = .center
        updateWeightLabel()
    }
    
    @objc private func confirmButtonTapped() {
        let selectedWeight = Int(weightSlider.value)
        print("Selected Weight: \(selectedWeight)")
        let nextViewController = HeightSelectViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
        // Perform further actions with the selected weight
    }
    
    @objc private func weightSliderValueChanged() {
        let selectedWeight = Int(weightSlider.value)
        let progress = Float(selectedWeight - weightRange.lowerBound) / Float(weightRange.upperBound - weightRange.lowerBound)
        weightProgressView.progress = progress
        updateWeightLabel()
    }
    
    private func updateWeightLabel() {
        let selectedWeight = Int(weightSlider.value)
        weightLabel.text = "\(selectedWeight) kg"
    }
}

