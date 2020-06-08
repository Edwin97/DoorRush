//
//  AccountBasicCell.swift
//  DoorRush
//
//  Created by edwin on 08/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class AccountBasicCell: BaseCell {
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.medium(ofSize: 18)
        label.text = "Edwin Chan"
        return label
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
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
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
        addSubview(stackView)
        addSubview(nextImageView)
        addSubview(separatorView)
        
        stackView.addArrangedSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            nextImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextImageView.leftAnchor.constraint(equalTo: stackView.rightAnchor, constant: 16),
            nextImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: nextImageView.leftAnchor, constant: -20),
            
            separatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

