//
//  DashBoardViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-14.
//

import UIKit

class DashBoardViewController: UIViewController{
    private let workoutsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(workoutsTableView)

        workoutsTableView.delegate = self
        workoutsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        workoutsTableView.frame = view.bounds
    }
    
}
 
extension DashBoardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->  Int{
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello world"
        cell.backgroundColor = .red
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
