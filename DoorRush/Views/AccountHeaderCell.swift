//
//  AccountHeaderCell.swift
//  DoorRush
//
//  Created by edwin on 08/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class AccountHeaderCell: BaseCell {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.bold(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            headerLabel.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
    
}
