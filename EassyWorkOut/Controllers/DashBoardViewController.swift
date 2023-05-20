//
//  DashBoardViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-14.
//

import UIKit

class DashBoardViewController: UIViewController {
    let sectionTitles: [String] = ["All Categories"]
    private let workoutsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(workoutsTableView)
        
        workoutsTableView.delegate = self
        workoutsTableView.dataSource = self
        configureNavigationBar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        workoutsTableView.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        workoutsTableView.frame = view.bounds
    }
    
    private func configureNavigationBar() {
        // Create a container view for the user name and profile picture
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        
        // Add the welcome label
        let welcomeLabel = UILabel()
        welcomeLabel.text = "Hi, Welcome"
        welcomeLabel.font = UIFont.systemFont(ofSize: 14)
        welcomeLabel.textColor = .label
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(welcomeLabel)
        
        // Add the user name label
        let nameLabel = UILabel()
        nameLabel.text = "Jeashan Anuja"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.textColor = .label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(nameLabel)
        
        // Add the profile picture image view
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "person.circle.fill")
        profileImageView.tintColor = .label
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        profileImageView.clipsToBounds = true
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(profileImageView)
        
        // Add constraints for the welcome label, user name label, and profile picture
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            welcomeLabel.bottomAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -4),
            nameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 4),
            profileImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            profileImageView.widthAnchor.constraint(equalToConstant: 30),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            profileImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        // Set the container view as the title view
        navigationItem.titleView = containerView
        
        navigationController?.navigationBar.tintColor = .white
    }


}

extension DashBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {
            return
        }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defultOffset = view.safeAreaInsets.top
        let offSet = scrollView.contentOffset.y + defultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offSet))
    }
}
