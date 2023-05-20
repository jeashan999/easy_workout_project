//
//  CollectionViewTableViewCell.swift
//  EassyWorkOut
//
//  Created by Jeashan anuja  on 2023-05-15.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // Sample workout data
    let workoutData: [(title: String, image: UIImage, details: String)] = [
        (title: "Cardiovascular Exercises", image: UIImage(named: "Bicep")!, details: "Build muscle and strength"),
        (title: "Strength Training", image: UIImage(named: "Bicep")!, details: "Improve cardiovascular fitness"),
        (title: "Flexibility and Mobility", image: UIImage(named: "Bicep")!, details: "Build muscle and strength"),
        (title: "Group Fitness Classes", image: UIImage(named: "Bicep")!, details: "Improve cardiovascular fitness"),
        (title: "Sports-Specific Training", image: UIImage(named: "Bicep")!, details: "Improve cardiovascular fitness"),
        (title: "Outdoor Activities", image: UIImage(named: "Bicep")!, details: "Improve cardiovascular fitness"),
        (title: "Home Workouts", image: UIImage(named: "Bicep")!, details: "Improve cardiovascular fitness"),
    ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        // Get workout data for the cell
        let workout = workoutData[indexPath.item]
        
        // Create an image view to display the workout image
        let imageView = UIImageView(image: workout.image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        cell.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        
        // Create a label to display the workout title
        let titleLabel = UILabel()
        titleLabel.text = workout.title
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.backgroundColor = UIColor(white: 0, alpha: 0.6)
        titleLabel.layer.cornerRadius = 10
        titleLabel.clipsToBounds = true
        cell.contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.3) {
            cell?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        UIView.animate(withDuration: 0.3) {
            cell?.transform = .identity
        }
    }
}
