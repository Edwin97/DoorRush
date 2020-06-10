//
//  AccountSwitchCell.swift
//  DoorRush
//
//  Created by edwin on 10/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class AccountSwitchCell: BaseCell {
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.medium(ofSize: 18)
        label.text = "Edwin Chan"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.isOn = false
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        return switchButton
    }()
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
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
        addSubview(separatorView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(switchButton)
        
    }
    
    override func layoutSubviews() {
        
        NSLayoutConstraint.activate([
           
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                
            separatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
