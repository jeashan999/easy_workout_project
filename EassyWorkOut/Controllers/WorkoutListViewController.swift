//
//  WorkoutListViewController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-20.
//
import UIKit

class WorkoutListViewController: UIViewController {

    private let workoutsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: WorkoutTableViewCell.identifier)
        tableView.backgroundColor = UIColor.systemBackground
        tableView.separatorStyle = .none
        return tableView
    }()

    private let categoriesDropdown: UIButton = {
        let button = UIButton()
        button.setTitle("All Categories", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.addTarget(self, action: #selector(categoriesDropdownTapped), for: .touchUpInside)
        return button
    }()

    private let categoriesDropdownView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        tableView.backgroundColor = UIColor.systemBackground
        tableView.separatorStyle = .none
        return tableView
    }()

    private var workouts: [Workout] = []
    private let categories = ["All Categories", "Cardio", "Strength Training", "Yoga", "Pilates"]
    private var selectedCategory = "All Categories"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(workoutsTableView)
        view.addSubview(categoriesDropdown)
        view.addSubview(categoriesDropdownView)

        workoutsTableView.delegate = self
        workoutsTableView.dataSource = self
        categoriesDropdownView.delegate = self
        categoriesDropdownView.dataSource = self

//        configureNavigationBar()

        workouts = [
            Workout(title: "Cardio Workout 1", category: "Cardio", image: UIImage(named: "Cardio1")),
            Workout(title: "Strength Training 1", category: "Strength Training", image: UIImage(named: "StrengthTraining")),
            Workout(title: "Yoga Class 1", category: "Yoga", image: UIImage(named: "Yoga1")),
            Workout(title: "Pilates Class 1", category: "Pilates", image: UIImage(named: "Pilates1")),
            Workout(title: "Cardio Workout 2", category: "Cardio", image: UIImage(named: "Cardio1")),
            Workout(title: "Strength Training 2", category: "Strength Training", image: UIImage(named: "StrengthTraining2")),
            Workout(title: "Yoga Class 2", category: "Yoga", image: UIImage(named: "Yoga2")),
            Workout(title: "Pilates Class 2", category: "Pilates", image: UIImage(named: "Pilates1")),
        ]

        workoutsTableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        workoutsTableView.frame = view.bounds

        let titleLabel = UILabel()
        titleLabel.text = "Workout List"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .label
        titleLabel.sizeToFit()
        titleLabel.center.x = view.center.x
        titleLabel.frame.origin.y = navigationController?.navigationBar.frame.maxY ?? 0 + 16
        view.addSubview(titleLabel)

        categoriesDropdown.frame = CGRect(x: 16, y: titleLabel.frame.maxY + 16, width: view.frame.width - 32, height: 40)
        categoriesDropdown.center.x = view.center.x

        categoriesDropdownView.frame = CGRect(x: 16, y: categoriesDropdown.frame.maxY + 8, width: view.frame.width - 32, height: 200)
        categoriesDropdownView.center.x = view.center.x
        categoriesDropdownView.frame.origin.y = categoriesDropdown.frame.maxY + 8

        // Adjust the content inset to account for the navigation bar
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let topInset = navBarHeight + statusBarHeight
        workoutsTableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
    }


    private func configureNavigationBar() {
        let addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addBarButtonItem
        navigationController?.navigationBar.tintColor = .white
    }

    @objc private func addButtonTapped() {
        // Handle add button tap event
        print("View button tapped")
    }

    @objc private func categoriesDropdownTapped() {
        categoriesDropdownView.isHidden = !categoriesDropdownView.isHidden
    }
}

extension WorkoutListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == workoutsTableView {
            return workouts.count
        } else if tableView == categoriesDropdownView {
            return categories.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == workoutsTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutTableViewCell.identifier, for: indexPath) as? WorkoutTableViewCell else {
                return UITableViewCell()
            }

            let workout = workouts[indexPath.row]
            cell.configure(with: workout)
            cell.addButtonAction = {
                // Handle add button tap event for the specific workout
                let vc = SingleWorkoutDetailsViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                print("View button tapped for workout: \(workout.title)")
            }

            return cell
        } else if tableView == categoriesDropdownView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            let category = categories[indexPath.row]
            cell.textLabel?.text = category
            cell.textLabel?.textColor = (category == selectedCategory) ? .systemBlue : .label
            cell.textLabel?.font = (category == selectedCategory) ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 16)

            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == workoutsTableView {
            return 100
        } else if tableView == categoriesDropdownView {
            return 40
        }
        return 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == categoriesDropdownView {
            selectedCategory = categories[indexPath.row]
            categoriesDropdown.setTitle(selectedCategory, for: .normal)
            categoriesDropdownView.isHidden = true
            workoutsTableView.reloadData()
        }
    }
}

struct Workout {
    let title: String
    let category: String
    let image: UIImage?
}

class WorkoutTableViewCell: UITableViewCell {
    static let identifier = "WorkoutTableViewCell"

    private let workoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
    }()

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("View", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()

    var addButtonAction: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(workoutImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(button)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        workoutImageView.frame = CGRect(x: 16, y: 16, width: 68, height: 68)
        titleLabel.frame = CGRect(x: workoutImageView.frame.maxX + 16, y: 16, width: contentView.frame.width - workoutImageView.frame.maxX - 32, height: 20)
        categoryLabel.frame = CGRect(x: workoutImageView.frame.maxX + 16, y: titleLabel.frame.maxY + 4, width: contentView.frame.width - workoutImageView.frame.maxX - 32, height: 16)
        button.frame = CGRect(x: contentView.frame.width - 56, y: 16, width: 40, height: 20)
    }

    func configure(with workout: Workout) {
        workoutImageView.image = workout.image
        titleLabel.text = workout.title
        categoryLabel.text = workout.category
    }

    @objc private func addButtonTapped() {
        addButtonAction?()
    }
}

//class SingleWorkoutDetailsViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        title = "Workout Details"
//    }
//}
