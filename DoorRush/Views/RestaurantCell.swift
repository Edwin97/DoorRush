//
//  DestinationCell.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class RestaurantCell: BaseCell {
    
    var restaurant: Restuarant? {
        didSet {
            featuredImage.image = UIImage(named: (restaurant?.imageName)!)
            restaurantLabel.text = restaurant?.name
            featureLabel.text = restaurant?.feature
        }
    }
    
    lazy var featuredImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "foodpizza")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
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
        label.text = "20 min - Free delivery"
        label.font = UIFont(name: "TTNorms-Regular", size: 15)
        label.textColor = UIColor(named: "grey")
        return label
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
        
        verticalStack.addArrangedSubview(featuredImage)
        verticalStack.addArrangedSubview(restaurantLabel)
        verticalStack.addArrangedSubview(featureLabel)
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            verticalStack.leftAnchor.constraint(equalTo: leftAnchor),
            verticalStack.rightAnchor.constraint(equalTo: rightAnchor),
        ])
        
        verticalStack.setCustomSpacing(15, after: featuredImage)
    }
}
