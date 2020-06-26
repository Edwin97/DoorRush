//
//  UnavailableController.swift
//  DoorRush
//
//  Created by edwin on 26/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class UnavailableController: UIViewController {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Service unavailable"
        titleLabel.font = UIFont.medium(ofSize: 22)
        titleLabel.textAlignment = .center
        return titleLabel
    }()
    
    let messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "Edwin is taking a break, keep waiting faetures might be implemented"
        messageLabel.font = UIFont.regular(ofSize: 18)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        return messageLabel
    }()
    
    let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(named: "unavailable")
        iconImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        return iconImageView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.navigationBar.setCustomFont()
        navigationItem.title = "503"
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        stackView.setCustomSpacing(10, after: iconImageView)
        stackView.setCustomSpacing(10, after: titleLabel)
    }
    

}
