//
//  DashBoardViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-14.
//

import UIKit

class DashBoardViewController: UIViewController{
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
            // Remove the image and set the app name with a different font
            let appNameLabel = UILabel()
            appNameLabel.text = "EassyWorkOut"
            appNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
            appNameLabel.textColor = .white
            navigationItem.titleView = appNameLabel
            
            // Right bar button item with gear icon
            let gearBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(gearButtonTapped))
            
            navigationItem.rightBarButtonItem = gearBarButtonItem
            navigationController?.navigationBar.tintColor = .white
        }
        
        @objc private func gearButtonTapped() {
            // Handle gear button tap event
        }
    }
extension DashBoardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->  Int{
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello world"
//        cell.backgroundColor = .red
//        return cell
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
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defultOffset = view.safeAreaInsets.top
        let offSet = scrollView.contentOffset.y + defultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0,-offSet))
    }
}
