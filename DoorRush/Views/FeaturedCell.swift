//
//  FeaturedCell.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class FeaturedCell: BaseCell {
    
    var imageName: String? {
        didSet {
            featuredImage.image = UIImage(named: imageName!)
        }
    }
    
    let featuredImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .redraw
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(featuredImage)
        
        featuredImage.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        featuredImage.heightAnchor.constraint(equalToConstant: contentView.frame.height).isActive = true
//        featuredImage.image = UIImage(named: "featuredWork")
        
        NSLayoutConstraint.activate([
            featuredImage.topAnchor.constraint(equalTo: topAnchor),
            featuredImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            featuredImage.leftAnchor.constraint(equalTo: leftAnchor),
            featuredImage.rightAnchor.constraint(equalTo: rightAnchor),
        ])
        
    }
}
