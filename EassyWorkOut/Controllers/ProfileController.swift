//
//  ProfileController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-14.
//

import UIKit

class ProfileController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        title = "Profile"
               
        // Add the Logout button to the navigation bar
        let logoutButton = UIButton(type: .system)
        logoutButton.setImage(UIImage(systemName: "power.circle.fill"), for: .normal)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)

        let logoutBarButton = UIBarButtonItem(customView: logoutButton)
        navigationItem.rightBarButtonItem = logoutBarButton


    }
    

    @objc private func logoutTapped() {
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
