//
//  DestinationCell.swift
//  Adventure App
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class RestaurantCell: BaseCell {
    
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
        label.text = "$$ - Convenience"
        label.font = UIFont(name: "TTNorms-Regular", size: 15)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.6 stars"
        label.font = UIFont(name: "TTNorms-Regular", size: 15)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "24 min"
        label.font = UIFont(name: "TTNorms-Regular", size: 15)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Free delivery"
        label.font = UIFont(name: "TTNorms-Regular", size: 15)
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let leftVerticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    let rightVerticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 5
        return stackView
    }()
    
    let groupVerticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 10
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
        return view
    }()
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(separatorView)
        addSubview(container)
        container.addSubview(groupVerticalStack)
        container.addSubview(separatorView)
        
//        featuredImage.widthAnchor.constraint(equalToConstant: frame.width - 16 * 2).isActive = true
//        featuredImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        leftVerticalStack.addArrangedSubview(featureLabel)
        leftVerticalStack.addArrangedSubview(ratingLabel)
        
        rightVerticalStack.addArrangedSubview(durationLabel)
        rightVerticalStack.addArrangedSubview(deliveryLabel)
        
        horizontalStack.addArrangedSubview(leftVerticalStack)
        horizontalStack.addArrangedSubview(rightVerticalStack)
        
        groupVerticalStack.addArrangedSubview(featuredImage)
        groupVerticalStack.addArrangedSubview(restaurantLabel)
        groupVerticalStack.addArrangedSubview(horizontalStack)
        
        groupVerticalStack.setCustomSpacing(15, after: featuredImage)

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leftAnchor.constraint(equalTo: leftAnchor),
            container.rightAnchor.constraint(equalTo: rightAnchor),
            container.widthAnchor.constraint(equalToConstant: frame.width),
            
            groupVerticalStack.topAnchor.constraint(equalTo: topAnchor),
            groupVerticalStack.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -10),
            groupVerticalStack.leftAnchor.constraint(equalTo: leftAnchor),
            groupVerticalStack.rightAnchor.constraint(equalTo: rightAnchor),
            
            separatorView.topAnchor.constraint(equalTo: groupVerticalStack.bottomAnchor, constant: 10),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            separatorView.leftAnchor.constraint(equalTo: leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
        
    }
}
