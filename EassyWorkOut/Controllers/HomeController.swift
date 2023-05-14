//
//  HomeController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja on 2023-03-12.
//

import UIKit

class HomeController: UIViewController,MenuViewControllerDelegate {
    
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
        label.text = "Welcome to your easy workout app dashboard. Here, you can see your progress and upcoming workouts."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progressTintColor = .systemGreen
        progressView.trackTintColor = .systemGray
        progressView.progress = 0.5
        return progressView
    }()
    
    private let upcomingWorkoutsLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming Workouts:"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private let upcomingWorkoutsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    

    private let upcomingWorkouts = ["Chest Day - Monday", "Leg Day - Wednesday", "Back Day - Friday"]

 override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(summaryLabel)
        view.addSubview(progressView)
        view.addSubview(upcomingWorkoutsLabel)
        view.addSubview(upcomingWorkoutsTableView)
        
        upcomingWorkoutsTableView.dataSource = self

         setupConstraints()
     
        let hamburgerButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(openMenu))
            navigationItem.leftBarButtonItem = hamburgerButton

            menuViewController = MenuViewController()
            addChild(menuViewController!)
            menuViewController!.view.frame = view.bounds
            view.addSubview(menuViewController!.view)
            menuViewController!.didMove(toParent: self)

            // Hide the menu initially
            menuViewController?.view.frame.origin.x = -view.frame.width
            menuViewController?.delegate = self
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        upcomingWorkoutsLabel.translatesAutoresizingMaskIntoConstraints = false
//        upcomingWorkoutsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            summaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            summaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            summaryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            progressView.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 32),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            upcomingWorkoutsLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 32),
            upcomingWorkoutsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
//            upcomingWorkoutsTableView.topAnchor.constraint(equalTo: upcomingWorkoutsLabel.bottomAnchor, constant: 16),
//            upcomingWorkoutsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            upcomingWorkoutsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            upcomingWorkoutsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    @objc private func openMenu() {
        UIView.animate(withDuration: 0.3) {
            if self.menuViewController?.view.frame.origin.x == -self.view.frame.width {
                // Show the menu
                self.menuViewController?.view.frame.origin.x = 0
            } else {
                // Hide the menu
                self.menuViewController?.view.frame.origin.x = -self.view.frame.width
            }
        }
    }
    
    
    func menuViewControllerDidSelectOption(_ option: MenuOption) {
          // Handle option selection
          switch option {
          case .home:
              // Navigate to Home screen
              let homeViewController = HomeController()
              let navigationController = UINavigationController(rootViewController: homeViewController)
              navigationController.modalPresentationStyle = .fullScreen
              self.present(navigationController, animated: true, completion: nil)
              
              break
          case .profile:
              // Navigate to Profile screen
              break
          case .settings:
              // Navigate to Settings screen
              break
          default:
              break
          }
      }
      
      func menuViewControllerDidSelectLogout() {
          // Handle logout action
          // show a confirmation alert and sign out the user if confirmed
          let alert = UIAlertController(title: "Logout", message: "Are you sure you want to log out?", preferredStyle: .alert)
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
          let confirmAction = UIAlertAction(title: "Logout", style: .destructive) { _ in
              // Sign out the user
              
          // Redirect to the login screen
          let loginViewController = LoginController()
          let navigationController = UINavigationController(rootViewController: loginViewController)
          navigationController.modalPresentationStyle = .fullScreen
          self.present(navigationController, animated: true, completion: nil)
      }
          alert.addAction(cancelAction)
          alert.addAction(confirmAction)
          present(alert, animated: true, completion: nil)
      }
  }




extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return upcomingWorkouts.count
  }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = upcomingWorkouts[indexPath.row]
        return cell
    }
}
