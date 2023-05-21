//
//  CatagoriesWorkoutListViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-21.
//

import UIKit

class CatagoriesWorkoutListViewController: UIViewController {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Weight Loss Workouts"
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
        
        // Add workout cards to the content view
        addWorkoutCard(title: "Cardio Workout", description: "High-intensity cardio exercises for weight loss.")
        addWorkoutCard(title: "HIIT Workout", description: "High-intensity interval training for burning calories.")
        addWorkoutCard(title: "Strength Training", description: "Strength exercises to build lean muscle and boost metabolism.")
        addWorkoutCard(title: "Circuit Training", description: "Combine cardio and strength exercises for an effective fat-burning workout.")
        addWorkoutCard(title: "Yoga for Weight Loss", description: "Dynamic yoga sequences to improve flexibility and burn calories.")
        addWorkoutCard(title: "Pilates Workout", description: "Strengthen your core and tone muscles for weight loss.")
    }
    
    private func addWorkoutCard(title: String, description: String) {
        let cardView = WorkoutCardView(title: title, description: description)
        contentView.addArrangedSubview(cardView)
        
        cardView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Add target action to the button
        cardView.button.addTarget(self, action: #selector(workoutButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func workoutButtonTapped(_ sender: UIButton) {
        if let cardView = sender.superview as? WorkoutCardView {
            let alertController = UIAlertController(title: "Proceed", message: "Do you want to proceed?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let okayAction = UIAlertAction(title: "OK", style: .default) { _ in
                // Navigate to a new controller
                
                        let videoURLString = "https://www.youtube.com/watch?v=N8ILF4xr9nY"
                        let description = "Super-Pump Arm Workout"
    
            
                        let workoutDetailViewController = WorkoutDetailViewController(videoURLString: videoURLString,                               workoutDescription: description)
                        self.present(workoutDetailViewController, animated: true, completion: nil)

                let newController = ExerciseDetailsViewController()
                self.navigationController?.pushViewController(newController, animated: true)
            }
            alertController.addAction(cancelAction)
            alertController.addAction(okayAction)

            present(alertController, animated: true, completion: nil)
        }
    }
    
    // Define WorkoutCardView here
    class WorkoutCardView: UIView {
        let titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .label
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            return label
        }()
        
        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16)
            label.numberOfLines = 0
            label.textColor = .gray
            return label
        }()
        
        let button: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Start Workout", for: .normal)
            button.backgroundColor = .blue
            button.layer.cornerRadius = 8
            return button
        }()
        
        var title: String
        
        init(title: String, description: String) {
            self.title = title
            
            super.init(frame: .zero)
            
            self.titleLabel.text = title
            self.descriptionLabel.text = description
            
            setupLayout()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupLayout() {
            addSubview(titleLabel)
            addSubview(descriptionLabel)
            addSubview(button)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                button.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                button.heightAnchor.constraint(equalToConstant: 40),
                button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            ])
        }
    }
}

