//
//  Alert.swift
//  DoorRush
//
//  Created by edwin on 24/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit
import Firebase

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

    func setEmptyView(iconImage: String, title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.medium(ofSize: 22)
        titleLabel.textAlignment = .center
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.font = UIFont.regular(ofSize: 16)
        messageLabel.textColor = UIColor(named: "grey")
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
        stackView.setCustomSpacing(10, after: titleLabel)
    }
    
    func setAnonymousView(iconImage: String, title: String, message: String, buttonTitle: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
    
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.bold(ofSize: 22)
        titleLabel.textAlignment = .center
        
        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.font = UIFont.regular(ofSize: 16)
        messageLabel.textColor = UIColor(named: "grey")
        messageLabel.textAlignment = .center

        let signUpButton = UIButton(type: .custom)
        signUpButton.setTitle(buttonTitle, for: .normal)
        signUpButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signUpButton.titleLabel?.font = UIFont.bold(ofSize: 16)
        signUpButton.backgroundColor = .systemBlue
        signUpButton.titleLabel?.textColor = .white
        signUpButton.layer.cornerRadius = 5
        signUpButton.adjustsImageWhenHighlighted = false
        signUpButton.addTarget(self, action: #selector(onSignUp), for: .touchUpInside)
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Already have an account? Login", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginButton.titleLabel?.font = UIFont.bold(ofSize: 16)
        loginButton.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
        
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: iconImage)
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, messageLabel, signUpButton, loginButton])
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
            signUpButton.widthAnchor.constraint(equalToConstant: 280),
        ])
        
        stackView.setCustomSpacing(10, after: iconImageView)
        stackView.setCustomSpacing(10, after: titleLabel)
        stackView.setCustomSpacing(25, after: messageLabel)
    }
    
    func restore() {
        self.backgroundView = nil
    }
    
    @objc func onSignUp(rootView: UIViewController) {
        let viewController = SignUpController()
        viewController.modalPresentationStyle = .fullScreen
      
    }
    
    @objc func onLogin() {
        //TODO
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension UIApplication {

    class func getTopMostViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        } else {
            return nil
        }
    }
}
