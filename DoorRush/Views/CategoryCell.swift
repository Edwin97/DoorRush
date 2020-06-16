//
//  CategoryCell.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class CategoryCell: BaseCell {
    
    var category: Category? {
        didSet {
            categoryImage.image = UIImage(named: category!.imageName)
            titleLabel.text = category?.title
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                categoryImage.image = UIImage(named: "\(category!.imageName)-tap")
                titleLabel.textColor = UIColor(named: "red")
                titleLabel.font = UIFont.bold(ofSize: 15)
            } else {
                categoryImage.image = UIImage(named: category!.imageName)
                titleLabel.textColor = UIColor(named: "grey")
                titleLabel.font = UIFont.medium(ofSize: 15)
            }
        }
    }
    
    let categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.medium(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView =  UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
//        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(categoryImage)
        stackView.addArrangedSubview(titleLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
//            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
