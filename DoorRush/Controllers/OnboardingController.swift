//
//  OnBroadingController.swift
//  DoorRush
//
//  Created by edwin on 05/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {
    
    let onBoards = [OnBoard(imageName: "onboard1", title: "Become a Dasher", description: "As a delivery driver, you'll make reliable money—working anytime, anywhere."),
                    OnBoard(imageName: "onboard2", title: "Become a Partner", description: "Grow your business and reach new customers by partnering with us."),
                    OnBoard(imageName: "onboard3", title: "Try the App", description: "Get the leading DoorRush experience with live order tracking."),
    ]
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor(named: "grey"), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(named: "grey-light")?.cgColor
        button.layer.borderWidth = 2
        button.titleLabel?.font = UIFont(name: "TTNorms-Medium", size: 16)
        button.addTarget(self, action: #selector(toSignIn), for: .touchUpInside)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create an Account", for: .normal)
        button.backgroundColor = UIColor(named: "red")
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "TTNorms-Medium", size: 16)
        button.addTarget(self, action: #selector(toSignUp), for: .touchUpInside)
        return button
    }()
        
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled =  true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = onBoards.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(named: "grey-default")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "grey")
        return pageControl
    }()
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "DoorRush"
        label.font = UIFont(name: "TTNorms-Bold", size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor(named: "red")
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(logoLabel)
        stackView.addArrangedSubview(collectionView)
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(signUpButton)
        
        configureCollectionView()
        registerCell()
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            signInButton.heightAnchor.constraint(equalToConstant: 45),
            signUpButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
    }
    
    func registerCell() {
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.reuseIdentifier)
    }
    
    @objc func toSignIn() {
        let viewController = SignInController()
        viewController.modalPresentationStyle = .fullScreen
         self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func toSignUp() {
        let viewController = SignUpController()
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension OnboardingController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.reuseIdentifier, for: indexPath) as! OnboardingCell
        cell.onBoard = onBoards[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
           pageControl.currentPage = Int(pageNumber)
    }
}
