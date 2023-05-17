//
//  FitnessGoalSelectController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-17.
//


import UIKit

class FitnessGoalSelectController: UIViewController {
    
    // MARK: - Properties
    
    private let headerView = AuthHeaderView(title: "Select Your Fitness Goal", subTitle: "To start your fitness journey")
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "Fitness Goal"
        
        view.addSubview(headerView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Header View
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 222),
            
            // Scroll View
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Stack View
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 16
        
        // Add Fitness Goals to Stack View
        let fitnessGoals: [(title: String, subtitle: String, imageName: String)] = [
            ("Lose Weight", "Reduce body weight by 10-20%", "lose_weight"),
            ("Build Muscle", "Increase muscle mass and strength", "build_muscle"),
            ("Improve Fitness", "Enhance cardiovascular health and endurance", "improve_fitness"),
            ("Maintain Health", "Sustain current level of fitness and health", "maintain_health"),
        ]
        
        for (index, goal) in fitnessGoals.enumerated() {
            let cardView = FitnessGoalCardView(title: goal.title, subtitle: goal.subtitle, imageName: goal.imageName)
            
            // Configure navigation handler for the card view
            cardView.navigationHandler = { [weak self] in
                // Perform navigation logic here
                let nextViewController = AgeSelectViewController()
                self?.navigationController?.pushViewController(nextViewController, animated: true)
            }
            
            cardView.layer.shadowColor = UIColor.black.cgColor
            cardView.layer.shadowOpacity = 0.2
            cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
            cardView.layer.shadowRadius = 4
            
            cardView.layer.cornerRadius = 12
            cardView.layer.masksToBounds = true
            
            cardView.tag = index
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCard(_:)))
            cardView.addGestureRecognizer(tapGesture)
            
            stackView.addArrangedSubview(cardView)
        }
    }
    
    @objc private func didTapCard(_ sender: UITapGestureRecognizer) {
        guard let cardView = sender.view as? FitnessGoalCardView else { return }
        
        // Highlight selected card
        for subview in stackView.arrangedSubviews {
            guard let subview = subview as? FitnessGoalCardView else { continue }
            
            if subview == cardView {
                subview.setHighlighted(true)
            } else {
                subview.setHighlighted(false)
            }
        }
    }
}
