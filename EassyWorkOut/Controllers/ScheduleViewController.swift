//
//  ScheduleViewController.swift
//  EassyWorkOut
//
//  Created by jeashn anuja  on 2023-05-14.
//
import UIKit

class ScheduleTableViewCell: UITableViewCell {
    static let identifier = "ScheduleTableViewCell"
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.8)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(timeLabel)
        cardView.addSubview(locationLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cardView.frame = CGRect(x: 16, y: 8, width: contentView.frame.width - 32, height: contentView.frame.height - 16)
        
        titleLabel.frame = CGRect(x: 16, y: 16, width: cardView.frame.width - 32, height: 20)
        timeLabel.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 4, width: cardView.frame.width - 32, height: 16)
        locationLabel.frame = CGRect(x: 16, y: timeLabel.frame.maxY + 4, width: cardView.frame.width - 32, height: 16)
    }
    
    func configure(with schedule: Schedule) {
        titleLabel.text = schedule.title
        timeLabel.text = "Date & Time: \(schedule.datetime)"
        locationLabel.text = "Location: \(schedule.location)"
    }
}

struct Schedule {
    let title: String
    let datetime: String
    let location: String
}

class ScheduleViewController: UIViewController {
    private let schedulesTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.identifier)
        tableView.backgroundColor = UIColor.systemBackground
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var schedules: [Schedule] = [
        Schedule(title: "Yoga Class", datetime: "2023-05-20 10:00 AM", location: "Studio A"),
        Schedule(title: "Weightlifting", datetime: "2023-05-20 10:00 AM ", location: "Gym Floor"),
        Schedule(title: "Cardio Workout", datetime: "2023-05-20 10:00 AM", location: "Cardio Area"),
        Schedule(title: "Sample Schedule 1", datetime: "2023-05-21 2:00 PM", location: "Location 1"),
        Schedule(title: "Sample Schedule 2", datetime: "2023-05-22 4:30 PM", location: "Location 2"),
        Schedule(title: "Sample Schedule 3", datetime: "2023-05-23 9:30 AM", location: "Location 3"),
        Schedule(title: "Sample Schedule 4", datetime: "2023-05-24 6:00 PM", location: "Location 4"),
        Schedule(title: "Sample Schedule 5", datetime: "2023-05-25 11:00 AM", location: "Location 5"),
        Schedule(title: "Sample Schedule 6", datetime: "2023-05-26 3:30 PM", location: "Location 6"),
        Schedule(title: "Sample Schedule 7", datetime: "2023-05-27 8:30 AM", location: "Location 7"),
        Schedule(title: "Sample Schedule 8", datetime: "2023-05-28 5:00 PM", location: "Location 8"),
        Schedule(title: "Sample Schedule 9", datetime: "2023-05-29 10:30 AM", location: "Location 9"),
        Schedule(title: "Sample Schedule 10", datetime: "2023-05-30 1:30 PM", location: "Location 10")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(schedulesTableView)
        
        schedulesTableView.delegate = self
        schedulesTableView.dataSource = self
        configureNavigationBar()
        
        schedulesTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        schedulesTableView.frame = view.bounds
    }
    
    private func configureNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "Schedules"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .label
        navigationItem.titleView = titleLabel
        
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addBarButtonItem
        navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    @objc private func addButtonTapped() {
        // Handle add button tap event
        let createScheduleController = CreateScheduleController()
        createScheduleController.modalPresentationStyle = .overFullScreen
        present(createScheduleController, animated: false, completion: nil)
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else {
            return UITableViewCell()
        }
        
        let schedule = schedules[indexPath.row]
        cell.configure(with: schedule)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection event
        let schedule = schedules[indexPath.row]
        let alertController = UIAlertController(title: "Do you want to start?", message: schedule.title, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let newController = CatagoriesWorkoutListViewController()
            self.navigationController?.pushViewController(newController, animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

class NewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let titleLabel = UILabel()
        titleLabel.text = "New Controller"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        titleLabel.center = view.center
        view.addSubview(titleLabel)
    }
}

//class CreateScheduleController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        
//        let titleLabel = UILabel()
//        titleLabel.text = "Create Schedule"
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
//        titleLabel.textColor = .label
//        titleLabel.textAlignment = .center
//        titleLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
//        titleLabel.center = view.center
//        view.addSubview(titleLabel)
//    }
//}
