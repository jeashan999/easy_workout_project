//
//  SmallCardTableViewCell.swift
//  EassyWorkOut
//
//  Created by neat lanka  on 2023-05-21.
//

import UIKit

class SmallCardTableViewCell: UITableViewCell {
    static let identifier = "SmallCardTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Configure the cell's appearance and layout
        backgroundColor = .white
        // Add subviews and set up constraints
        
        // Example: Add a label to display content
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.textColor = .black
        // Configure the label's appearance and layout
        // ...
        
        contentView.addSubview(contentLabel)
        
        // Add constraints for the content label
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
