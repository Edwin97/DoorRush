//
//  OrderController.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class OrderController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Orders"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.backgroundColor = UIColor(named: "grey-light")
        
        collectionView.register(OrderCell.self, forCellWithReuseIdentifier: "OrderCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCell", for: indexPath) as! OrderCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: collectionView.frame.width, height: 120)
      }
}
