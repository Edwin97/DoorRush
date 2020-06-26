//
//  RegisterController.swift
//  DoorRush
//
//  Created by edwin on 05/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//


import UIKit
import Firebase
import GoogleSignIn

class SignUpController: UIViewController {
    
    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = UIFont.medium(ofSize: 13)
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.font = UIFont.regular(ofSize: 16)
        return textField
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.font = UIFont.medium(ofSize: 13)
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Phone Number"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.font = UIFont.regular(ofSize: 16)
        return textField
    }()
    
    
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
        textField.autocapitalizationType = .none
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
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Sign Up", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.titleLabel?.font = UIFont.bold(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 5
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(onSignUp), for: .touchUpInside)
        return button
    }()
    
     let termLabel: UILabel = {
        let label = UILabel()
        label.text = "By tapping Sign Up, Continue with Facebook, Continue with Google, you agree to our Terms and Conditions and Privacy Statement"
        label.font = UIFont.medium(ofSize: 14)
        label.textAlignment = .center
        label.textColor = UIColor(named: "grey")
        label.textAlignment =  .left
        label.numberOfLines = 0
        return label
    }()
    
    let divideLabel: UILabel = {
        let label = UILabel()
        label.text = "or continue with email"
        label.font = UIFont.medium(ofSize: 16)
        label.textAlignment = .center
        label.textColor = UIColor(named: "grey")
        return label
    }()
    
    let googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue with Google", for: .normal)
        button.setImage(UIImage(named: "google"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.adjustsImageWhenHighlighted = false
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.titleLabel?.font = UIFont.bold(ofSize: 16)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(googleSignin), for: .touchUpInside)
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue with Facebook", for: .normal)
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.backgroundColor = UIColor(named: "facebook-blue")
        button.adjustsImageWhenHighlighted = false
        button.titleLabel?.font = UIFont.bold(ofSize: 16)
        button.layer.cornerRadius = 5
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
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
        setupPageSegment()
        setupBarItems()
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(googleButton)
        stackView.addArrangedSubview(facebookButton)
        stackView.addArrangedSubview(divideLabel)
        stackView.addArrangedSubview(firstNameLabel)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(phoneTextField)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTexField)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(termLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
        
        stackView.setCustomSpacing(10, after: emailTextField)
        stackView.setCustomSpacing(10, after: passwordTexField)
        stackView.setCustomSpacing(10, after: signInButton)
        stackView.setCustomSpacing(20, after: divideLabel)
    }
    
    func setupBarItems() {
        if self.parent != nil{
            self.parent?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(onSkip))
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Skip", style: .plain, target: self, action: #selector(onSkip))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.parent?.navigationItem.rightBarButtonItem = nil
    }
    
    @objc func googleSignin() {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @objc func onSignUp() {
        guard usernameTextField.hasText && phoneTextField.hasText && emailTextField.hasText && passwordTexField.hasText else {
            showAlert(title: "All fields are required", message: "Please enter the required information in every field.")
            return
        }
        
        createUserWithEmail()
    }
    
    @objc func onSkip() {
        Auth.auth().signInAnonymously() { (authResult, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func setupPageSegment() {
        let items = ["Sign In", "Sign Up"]
        let filtersSegment = UISegmentedControl(items: items)
        filtersSegment.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        filtersSegment.selectedSegmentIndex = 1
        filtersSegment.tintColor = UIColor.black
        filtersSegment.addTarget(self, action: #selector(self.filterApply), for: UIControl.Event.valueChanged)
        navigationItem.titleView = filtersSegment
    }
    
    @objc private func filterApply(segment: UISegmentedControl) -> Void {
        switch segment.selectedSegmentIndex {
        case 0:
            remove()
            add(SignInController())
        case 1:
            remove()
            add(SignUpController())
        default:
            onSignUp()
        }
    }
    
    func createUserWithEmail() {
        guard let username = usernameTextField.text, let phone = phoneTextField.text, let email = emailTextField.text, let password = passwordTexField.text else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                self.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
            
            if let auth = authResult {
                self.addUserDocument(userId: auth.user.uid, username: username, email: email, phone: phone)
            }
        }
    }
    
    func addUserDocument(userId: String, username: String, email: String, phone: String) {
        let db = Firestore.firestore()
        
        db.collection("users").addDocument(data: ["userId": userId, "username": username, "email": email, "phoneNumber": phone]) { (error) in
            if let error = error {
                self.showAlert(title: "Error", message: error.localizedDescription)
                return
            }
        }
    }
}

extension SignUpController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Google Sing In didSignInForUser")
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
        // When user is signed in
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                return
            }
            
            if let user = user {
                self.addUserDocument(userId: user.user.uid, username: user.user.displayName ?? "", email: user.user.email ?? "", phone: user.user.phoneNumber ?? "")
            }
        
        })
    }
    
    // Start Google OAuth2 Authentication
    func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
        
        // Showing OAuth2 authentication window
        if let aController = viewController {
            present(aController, animated: true) {() -> Void in }
        }
    }
    
    // After Google OAuth2 authentication
    func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        // Close OAuth2 authentication window
        dismiss(animated: true) {() -> Void in }
    }
}
