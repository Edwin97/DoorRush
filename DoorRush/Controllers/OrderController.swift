//
//  OrderController.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class OrderController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        
        // remove shadow on navbar
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "  Orders"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.bold(ofSize: 25)
        navigationItem.titleView = titleLabel
        
        collectionView.backgroundColor = UIColor(named: "grey-light")
        
        setupMenuBar()
    }
    
    let menuBar: MenuBar = {
        let menuBar = MenuBar()
        return menuBar
    }()
    
    private func setupMenuBar() {
        collectionView.addSubview(menuBar)
        
        NSLayoutConstraint.activate([
            menuBar.heightAnchor.constraint(equalToConstant: 100),
            menuBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            menuBar.leftAnchor.constraint(equalTo: view.rightAnchor),
            menuBar.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
    

}
