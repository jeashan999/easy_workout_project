//
//  HomeController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja on 2023-03-12.
//

import UIKit

class HomeController: UIViewController {

    private var menuViewController: MenuViewController?
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Easy Workout Dashboard"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "This app provides you with tools to track your workouts, set fitness goals, and monitor your progress. Stay motivated and achieve your fitness goals with Gym Dashboard!"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progressTintColor = .systemIndigo
        progressView.trackTintColor = .systemGray
        progressView.progress = 0.9 // Set the progress value as desired
        return progressView
    }()

    private let upcomingWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming Workouts:"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()

    private let upcomingWorkoutsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let upcomingWorkouts = [
        ("Chest Day - Monday", "10:00 AM - 11:00 AM", "60% Complete"),
        ("Leg Day - Wednesday", "11:00 AM - 12:00 PM", "60% Complete"),
        ("Arms Day - Friday", "12:00 PM - 1:00 PM", "80% Complete")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBackground

        view.addSubview(titleLabel)
        view.addSubview(summaryLabel)
        view.addSubview(progressView)
        view.addSubview(upcomingWorkoutsLabel)
        view.addSubview(upcomingWorkoutsCollectionView)

        upcomingWorkoutsCollectionView.dataSource = self
        upcomingWorkoutsCollectionView.delegate = self
        upcomingWorkoutsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        upcomingWorkoutsCollectionView.backgroundColor = .clear
        upcomingWorkoutsCollectionView.showsVerticalScrollIndicator = false
        upcomingWorkoutsCollectionView.translatesAutoresizingMaskIntoConstraints = false

        setupConstraints()
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        upcomingWorkoutsLabel.translatesAutoresizingMaskIntoConstraints = false
        upcomingWorkoutsCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            summaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            summaryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            progressView.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 8),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            upcomingWorkoutsLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 32),
            upcomingWorkoutsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            upcomingWorkoutsCollectionView.topAnchor.constraint(equalTo: upcomingWorkoutsLabel.bottomAnchor, constant: 16),
            upcomingWorkoutsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upcomingWorkoutsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upcomingWorkoutsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - MenuViewControllerDelegate

    func didSelectMenuItem(_ menuItem: String) {
        // Handle menu item selection here
        print("Selected menu item: \(menuItem)")
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingWorkouts.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemYellow

        // Configure the card view appearance
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true

        // Add labels to display the workout details
        let workoutTitleLabel = UILabel(frame: CGRect(x: 8, y: 8, width: cell.bounds.width - 16, height: 20))
        workoutTitleLabel.text = upcomingWorkouts[indexPath.item].0
        workoutTitleLabel.textAlignment = .center
        workoutTitleLabel.textColor = .black
        workoutTitleLabel.font = .systemFont(ofSize: 16)
        workoutTitleLabel.numberOfLines = 0
        cell.contentView.addSubview(workoutTitleLabel)

        let workoutTimeLabel = UILabel(frame: CGRect(x: 8, y: workoutTitleLabel.frame.maxY + 4, width: cell.bounds.width - 16, height: 16))
        workoutTimeLabel.text = upcomingWorkouts[indexPath.item].1
        workoutTimeLabel.textAlignment = .center
        workoutTimeLabel.textColor = .gray
        workoutTimeLabel.font = .systemFont(ofSize: 14)
        workoutTimeLabel.numberOfLines = 0
        cell.contentView.addSubview(workoutTimeLabel)

        let progressLabel = UILabel(frame: CGRect(x: 8, y: workoutTimeLabel.frame.maxY + 4, width: cell.bounds.width - 16, height: 16))
        progressLabel.text = upcomingWorkouts[indexPath.item].2
        progressLabel.textAlignment = .center
        progressLabel.textColor = .systemBlue
        progressLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        progressLabel.numberOfLines = 0
        cell.contentView.addSubview(progressLabel)

        // Add a progress view inside the card
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progressTintColor = .systemGreen
        progressView.trackTintColor = .systemGray
        progressView.progress = 0.7 // Set the progress value as desired
        progressView.frame = CGRect(x: 8, y: progressLabel.frame.maxY + 8, width: cell.bounds.width - 16, height: 10)
        cell.contentView.addSubview(progressView)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cardWidth = view.frame.width - 32
        let cardHeight: CGFloat = 120 // Adjust the height as desired
        return CGSize(width: cardWidth, height: cardHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
