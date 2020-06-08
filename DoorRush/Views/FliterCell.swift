//
//  FliterCell.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class FilterCell: BaseCell {
    
    var filter: String? {
        didSet {
            filterButton.setTitle(filter!, for: .normal)
        }
    }
    
    let filterButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Pickup", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "deafaultGrey")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "TTNorms-Regular", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        button.addTarget(self, action: #selector(enableFilter), for: .touchUpInside)
        return button
    }()
    
    @objc func enableFilter() {
        filterButton.setTitleColor(.black, for: .selected)
        filterButton.setTitleColor(.white, for: .selected)
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(filterButton)
        
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: topAnchor),
            filterButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            filterButton.leftAnchor.constraint(equalTo: leftAnchor),
            filterButton.rightAnchor.constraint(equalTo: rightAnchor),
        ])
        
    }
}
