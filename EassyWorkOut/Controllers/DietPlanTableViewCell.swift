//
//  DietPlanTableViewCell.swift
//  EassyWorkOut
//
//  Created by jeashan anuja  on 2023-05-21.
//

import UIKit

class DietPlanViewController: UIViewController {
    
    private let mealTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MealTableViewCell.self, forCellReuseIdentifier: MealTableViewCell.identifier)
        tableView.backgroundColor = UIColor.systemBackground
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var meals: [Meal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(mealTableView)
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
        meals = [
            Meal(title: "Breakfast", description: "Oatmeal with fruits", imageName: "breakfast.jpg"),
            Meal(title: "Mid-Morning Snack", description: "Protein shake", imageName: "MidMorning.jpg"),
            Meal(title: "Lunch", description: "Grilled chicken with vegetables", imageName: "lunch.jpeg"),
            Meal(title: "Afternoon Snack", description: "Mixed nuts",imageName: "Afternoonsnack.jpeg"),
            Meal(title: "Dinner", description: "Salmon with quinoa", imageName: "dinner.png"),
          Meal(title: "Evening Snack", description: "Greek yogurt with berries", imageName: "snack.png"),
            Meal(title: "Bedtime Snack", description: "Cottage cheese", imageName: "Bedtimesnack.jpeg")
     
            
        ]
        
        mealTableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mealTableView.frame = view.bounds
        title = "Diet Plan"
//        let titleLabel = UILabel()
//            titleLabel.text = "Diet Plan"
//            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
//            titleLabel.textColor = .label
//            titleLabel.sizeToFit()
//            titleLabel.center.x = view.center.x
//            titleLabel.frame.origin.y = navigationController?.navigationBar.frame.maxY ?? 0 + 50
//            view.addSubview(titleLabel)
    }
}

extension DietPlanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.identifier, for: indexPath) as? MealTableViewCell else {
            return UITableViewCell()
        }
        
        let meal = meals[indexPath.row]
        cell.configure(with: meal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

struct Meal {
    let title: String
    let description: String
    let imageName: String
}

class MealTableViewCell: UITableViewCell {
    static let identifier = "MealTableViewCell"
    
    private let mealImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mealImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mealImageView.frame = CGRect(x: 16, y: 8, width: 84, height: 84)
        titleLabel.frame = CGRect(x: mealImageView.frame.maxX + 12, y: 8, width: contentView.frame.width - mealImageView.frame.maxX - 24, height: 20)
        descriptionLabel.frame = CGRect(x: mealImageView.frame.maxX + 12, y: titleLabel.frame.maxY + 4, width: contentView.frame.width - mealImageView.frame.maxX - 24, height: contentView.frame.height - titleLabel.frame.maxY - 16)
    }
    
    func configure(with meal: Meal) {
        titleLabel.text = meal.title
        descriptionLabel.text = meal.description
        mealImageView.image = UIImage(named: meal.imageName)
    }
}
