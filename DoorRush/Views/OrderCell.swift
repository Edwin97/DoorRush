//
//  OrderCell.swift
//  DoorRush
//
//  Created by edwin on 10/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class OrderCell: BaseCell {
        
    let orderLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.bold(ofSize: 16)
        title.text = "ORD 16388-43"
        return title
    }()
    
    let datetimeLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.regular(ofSize: 14)
        title.text = "April 12, 18:31"
        return title
    }()
    
    let restaurantLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.regular(ofSize: 14)
        title.text = "Shelby"
        return title
    }()
    
    let priceLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.medium(ofSize: 15)
        title.text = "$9.90"
        title.textAlignment = .right
        return title
    }()
    
    let nextImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "arrow-right")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
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
    
    let separatorView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor(named: "grey-default")?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    override func setupViews() {
        
        addSubview(horizontalStack)
        addSubview(separatorView)
        
        verticalStack.addArrangedSubview(orderLabel)
        verticalStack.addArrangedSubview(datetimeLabel)
        verticalStack.addArrangedSubview(restaurantLabel)
        
        horizontalStack.addArrangedSubview(verticalStack)
        horizontalStack.addArrangedSubview(priceLabel)
        horizontalStack.addArrangedSubview(nextImageView)
        
        NSLayoutConstraint.activate([
            horizontalStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            horizontalStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            horizontalStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            separatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
