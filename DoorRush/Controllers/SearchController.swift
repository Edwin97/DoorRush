//
//  ExploreController.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

//TODO fix UI
class SearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let restaurantCell = "restaurantCell"
    let restaurants = [
       Restuarant(imageName: "pizzas", name: "Eataly", feature: "20 min · Free delivery"),
       Restuarant(imageName: "burgers", name: "Sam's Crispy Chicken", feature: "20 min · Free delivery"),
       Restuarant(imageName: "Bakery", name: "Dominique Ansel Bakery", feature: "20 min ·  Free delivery"),
       Restuarant(imageName: "sticky-finger", name: "Sticky's  Finger Joint", feature: "20 min ·  Free delivery")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = searchController
        
        collectionView.backgroundColor = .white
        
        registerCell()
    }
    
    func registerCell() {
        collectionView.register(RestaurantCell.self, forCellWithReuseIdentifier: restaurantCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantCell, for: indexPath) as! RestaurantCell
        cell.restaurant = restaurants[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
     }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 10
     }
    
}
