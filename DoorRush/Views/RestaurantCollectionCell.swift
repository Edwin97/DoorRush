//
//  DestinationCollectionCell.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class RestaurantCollectionCell: BaseCollectionCell {
    
    let restaurants = [
       Restuarant(imageName: "pizzas", name: "Eataly", feature: "20 min · Free delivery"),
       Restuarant(imageName: "burgers", name: "Sam's Crispy Chicken", feature: "20 min · Free delivery"),
       Restuarant(imageName: "Bakery", name: "Dominique Ansel Bakery", feature: "20 min ·  Free delivery"),
       Restuarant(imageName: "sticky-finger", name: "Sticky's  Finger Joint", feature: "20 min ·  Free delivery")
    ]
    
    let foodLabel: UILabel = {
       let label = UILabel()
        label.text = "National Favorites"
        label.font = UIFont(name: "TTNorms-Bold", size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let allButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.tintColor = UIColor(named: "red")
        button.contentHorizontalAlignment = .right
        button.titleLabel?.font = UIFont(name: "TTNorms-Regular", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return button
    }()
    
    let horizontalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func setupViews() {
        super.setupViews()
        
        contentView.backgroundColor = .white
        
        addSubview(horizontalStack)
        addSubview(collectionView)
    
        horizontalStack.addArrangedSubview(foodLabel)
        horizontalStack.addArrangedSubview(allButton)
    
        topConstraint?.isActive = false
        
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalToConstant: frame.width),
            
            horizontalStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            horizontalStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            horizontalStack.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0),
            
            collectionView.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func registerClass() {
        collectionView.register(RestaurantCell.self, forCellWithReuseIdentifier: RestaurantCell.reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCell.reuseIdentifier, for: indexPath) as! RestaurantCell
        cell.restaurant = restaurants[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 1.4, height: frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 10
     }
}
