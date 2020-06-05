//
//  SignInController.swift
//  Adventure App
//
//  Created by edwin on 05/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class SignInController: UIViewController {
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address"
        label.font = UIFont.medium(ofSize: 13)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Address"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.font = UIFont.regular(ofSize: 16)
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.medium(ofSize: 13)
        return label
    }()
    
    let passwordTexField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.font = UIFont.regular(ofSize: 16)
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sign In", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.titleLabel?.font = UIFont.bold(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 5
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(onSignIn), for: .touchUpInside)
        return button
    }()
    
    let forgotButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot password ?", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.titleLabel?.font = UIFont.bold(ofSize: 16)
        return button
    }()
    
    let divideLabel: UILabel = {
        let label = UILabel()
        label.text = "- OR -"
        label.font = UIFont.medium(ofSize: 16)
        label.textAlignment = .center
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sign In with Google", for: .normal)
        button.setImage(UIImage(named: "google"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.titleLabel?.font = UIFont.bold(ofSize: 16)
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sign In with Facebook", for: .normal)
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.backgroundColor = UIColor(named: "facebook-blue")
        button.adjustsImageWhenHighlighted = false
        button.titleLabel?.font = UIFont.bold(ofSize: 16)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTexField)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(forgotButton)
        stackView.addArrangedSubview(divideLabel)
        
        stackView.addArrangedSubview(googleButton)
        stackView.addArrangedSubview(facebookButton)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
        
        stackView.setCustomSpacing(10, after: emailTextField)
        stackView.setCustomSpacing(10, after: passwordTexField)
        stackView.setCustomSpacing(10, after: forgotButton)
        stackView.setCustomSpacing(20, after: divideLabel)
    }
    
    @objc func onSignIn() {
        let viewController = TabBarController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
