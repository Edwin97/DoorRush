//
//  AccountController.swift
//  Adventure App
//
//  Created by edwin on 06/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class AccountController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let accountCell = "accountCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        navigationItem.title = "Account"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.backgroundColor = .white
    }
    
    func registerCell() {
        collectionView.register(AccountCell.self, forCellWithReuseIdentifier: accountCell)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 48)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: accountCell, for: indexPath) as! AccountCell
        return cell
    }
    
}

class AccountCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.medium(ofSize: 16)
        label.text = "Edwin Chan"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.regular(ofSize: 14)
        label.text = "Change your account information"
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.6
        view.layer.borderColor = UIColor(named: "grey-light")?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    func setupViews() {
        addSubview(stackView)
        addSubview(separatorView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -16),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            separatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            
            separatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
