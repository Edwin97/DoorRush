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
                categoryView(imageName: "\(category!.imageName)-tap", colorName: "red", fontSize: 15)
            } else {
                categoryView(imageName: category!.imageName, colorName: "grey", fontSize: 15)
            }
        }
    }
    
    func categoryView(imageName: String, colorName: String, fontSize: CGFloat) {
        categoryImage.image = UIImage(named: imageName)
        titleLabel.textColor = UIColor(named: colorName)
        titleLabel.font = UIFont.medium(ofSize: fontSize)
    }
    
    let categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.medium(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView =  UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(categoryImage)
        stackView.addArrangedSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
        ])
    }
}
