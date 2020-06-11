//
//  OrderCell.swift
//  DoorRush
//
//  Created by edwin on 10/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class OrderCell: BaseCell {
    
    let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "meal")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()
    
    let restaurantLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.bold(ofSize: 16)
        title.text = "Snowflake - Sunway"
        return title
    }()
    
    let itemLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.regular(ofSize: 15)
        title.text = "1 item - Bandar Puteri Puchong"
        return title
    }()
    
    let dateLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.regular(ofSize: 16)
        title.text = "April 12, 18:31"
        return title
    }()
    
    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let horizontalStack: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 5
         return stackView
     }()
    
    override func setupViews() {
        contentView.backgroundColor = UIColor(named: "grey-light")
        
        addSubview(horizontalStack)
        
        verticalStack.addArrangedSubview(restaurantLabel)
        verticalStack.addArrangedSubview(itemLabel)
        
        horizontalStack.addArrangedSubview(foodImageView)
        horizontalStack.addArrangedSubview(verticalStack)
        horizontalStack.addArrangedSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            horizontalStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            horizontalStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            horizontalStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
        ])
    }
}
