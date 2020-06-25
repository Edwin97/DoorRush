//
//  OrderController.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit
import Firebase

class OrderController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var orders = ["Hello"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Orders"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.setCustomFont()
        
        collectionView.register(OrderCell.self, forCellWithReuseIdentifier: "OrderCell")
    }
    
    func isAnonynous() -> Bool {
        guard let user = Auth.auth().currentUser else {
            return false
        }
        
        if user.isAnonymous {
            return true
        }
        
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCell", for: indexPath) as! OrderCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isAnonynous() {
                        collectionView.setAnonymousView(iconImage: "anonymous-order", title: "Let's get rushing!", message: "Sign in to manage your orders", buttonTitle: "Sign In to View Orders")
            return 0
        } else if orders.count == 0 {
            collectionView.setEmptyView(iconImage: "empty-order", title: "You don't have any orders yet.", message: "Your orders will be in here.")
            return 0
        }

        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
