//
//  OnboardingCell.swift
//  Adventure App
//
//  Created by edwin on 05/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    var onBoard: OnBoard? {
        didSet {
            onBoardImage.image = UIImage(named: onBoard!.imageName)
            titleLabel.text = onBoard?.title
            descriptionLabel.text = onBoard?.description
        }
    }
    
    
    let onBoardImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "onBoard1")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 180).isActive = true
        image.widthAnchor.constraint(equalToConstant: 180).isActive = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Become a Dasher"
        label.font = UIFont.bold(ofSize: 24)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "As a delivery driver, you'll make reliable money—working anytime, anywhere."
        label.font = UIFont.regular(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(onBoardImage)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        stackView.setCustomSpacing(20, after: onBoardImage)
    }
}
