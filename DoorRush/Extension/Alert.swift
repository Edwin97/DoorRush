//
//  Alert.swift
//  DoorRush
//
//  Created by edwin on 24/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UITextField {
    
    var isEmpty: Bool {
        if let _ = self.text, self.text!.isEmpty {
            return false
        }
        return true
    }
}

extension UICollectionView {
    
    func setEmptyView(title: String, message: String, iconImage: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.medium(ofSize: 20)
        titleLabel.textAlignment = .center
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.font = UIFont.regular(ofSize: 18)
        messageLabel.textAlignment = .center
        
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: iconImage)
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, messageLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        
        emptyView.addSubview(stackView)
        
        self.backgroundView = emptyView
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -120),
            iconImageView.heightAnchor.constraint(equalToConstant: 200),
            iconImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        stackView.setCustomSpacing(10, after: iconImageView)
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
