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
        label.font = UIFont.medium(ofSize: 18)
        return label
    }()
    
    let featureLabel: UILabel = {
        let label = UILabel()
        label.text = "$$ Chinese, Asian and ZseChuan"
        label.font = UIFont.medium(ofSize: 14)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.7 Rating"
        label.font = UIFont.medium(ofSize: 14)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "22 min"
        label.font = UIFont.medium(ofSize: 14)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Free delivery"
        label.font = UIFont.medium(ofSize: 14)
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
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        super.setupViews()
        
        addSubview(verticalStack)
        addSubview(separatorView)
        
        firstHorizontalStack.addArrangedSubview(featureLabel)
        firstHorizontalStack.addArrangedSubview(durationLabel)
        
        secondHorizontalStack.addArrangedSubview(ratingLabel)
        secondHorizontalStack.addArrangedSubview(deliveryLabel)
        
        verticalStack.addArrangedSubview(featuredImage)
        verticalStack.addArrangedSubview(restaurantLabel)
        verticalStack.addArrangedSubview(firstHorizontalStack)
        verticalStack.addArrangedSubview(secondHorizontalStack)
        
        verticalStack.setCustomSpacing(10, after: featuredImage)
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -10),
            verticalStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            verticalStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            separatorView.leftAnchor.constraint(equalTo: leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        verticalStack.setCustomSpacing(5, after: restaurantLabel)
    }
}

