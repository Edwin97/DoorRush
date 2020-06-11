//
//  SearchCell.swift
//  DoorRush
//
//  Created by edwin on 11/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class SearchCell: BaseCell {
    
    var restaurant: Restuarant? {
        didSet {
            featuredImage.image = UIImage(named: (restaurant?.imageName)!)
            restaurantLabel.text = restaurant?.name
            featureLabel.text = restaurant?.feature
        }
    }
    
    let featuredImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "foodpizza")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let restaurantLabel: UILabel = {
        let label = UILabel()
        label.text = "New York Pizza"
        label.font = UIFont(name: "TTNorms-Medium", size: 18)
        return label
    }()
    
    let featureLabel: UILabel = {
        let label = UILabel()
        label.text = "$$ Chinese, Asian and ZseChuan"
        label.font = UIFont.regular(ofSize: 15)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.7 Rating"
        label.font = UIFont.regular(ofSize: 15)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "22 min"
        label.font = UIFont.regular(ofSize: 15)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Free delivery"
        label.font = UIFont.regular(ofSize: 15)
        label.textColor = UIColor(named: "grey")
        label.textAlignment = .right
        return label
    }()
    
    let firstHorizontalStack: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.spacing = 5
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    let secondHorizontalStack: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.spacing = 5
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    

    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(verticalStack)

        firstHorizontalStack.addArrangedSubview(featureLabel)
        firstHorizontalStack.addArrangedSubview(durationLabel)
        
        secondHorizontalStack.addArrangedSubview(ratingLabel)
         secondHorizontalStack.addArrangedSubview(deliveryLabel)
        
        verticalStack.addArrangedSubview(featuredImage)
        verticalStack.addArrangedSubview(restaurantLabel)
        verticalStack.addArrangedSubview(firstHorizontalStack)
        verticalStack.addArrangedSubview(secondHorizontalStack)
        
        verticalStack.setCustomSpacing(15, after: featuredImage)

        NSLayoutConstraint.activate([ verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            verticalStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
        
    }
}

