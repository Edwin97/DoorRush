//
//  DestinationCollectionCell.swift
//  Adventure App
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class RestaurantCollectionCell: BaseCollectionCell {
    
    let destinationCell = "destinationCell"
    let categories = [
        Category(imageName: "mcard1", title: "Hiking"),
        Category(imageName: "mcard2", title: "Diving"),
        Category(imageName: "mcard3", title: "Ski"),
        Category(imageName: "mcard4", title: "Skate")
    ]
    
    let foodLabel: UILabel = {
       let label = UILabel()
        label.text = "National Favorites"
        label.font = UIFont(name: "TTNorms-Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let allButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.contentHorizontalAlignment = .right
 
        return button
    }()
    
    let horizontalStack: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(horizontalStack)
        addSubview(collectionView)
    
        horizontalStack.addArrangedSubview(foodLabel)
        horizontalStack.addArrangedSubview(allButton)
    
        topConstraint?.isActive = false
        
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalToConstant: frame.width),
            
            horizontalStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            horizontalStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            horizontalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            horizontalStack.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
                    collectionView.rightAnchor.constraint(equalTo: rightAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
                    
//
//            verticalStackView.topAnchor.constraint(equalTo: topAnchor),
//            verticalStackView.leftAnchor.constraint(equalTo: leftAnchor),
//            verticalStackView.rightAnchor.constraint(equalTo: rightAnchor),
//            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    override func registerClass() {
        collectionView.register(RestaurantCell.self, forCellWithReuseIdentifier: destinationCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: destinationCell, for: indexPath) as! RestaurantCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 1.3, height: frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 10
     }
}
