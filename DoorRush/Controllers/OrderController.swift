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
            collectionView.setEmptyView(title: "You don't have any orders yet.", message: "Your orders will be in here.", iconImage: "empty-order")
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
