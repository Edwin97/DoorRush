//
//  ViewController.swift
//  Adventure App
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class ActivityController: UIViewController {
    
    var collectionView: UICollectionView?
    
    let baseCell = "baseCell"
    let categoryCollectionCell = "categoryCollectionCell"
    let filterCollectionCell = "filterCollectionCell"
    let featuredCollectionCell = "featuredCollectionCell"
    let destinationCollectionCell = "destinationCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
        registerCell()
    }
    
    func registerCell() {
        collectionView?.register(BaseCollectionCell.self, forCellWithReuseIdentifier: baseCell)
        collectionView?.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: categoryCollectionCell)
        collectionView?.register(FilterCollectionCell.self, forCellWithReuseIdentifier: filterCollectionCell)
        collectionView?.register(FeaturedCollectionCell.self, forCellWithReuseIdentifier: featuredCollectionCell)
        collectionView?.register(RestaurantCollectionCell.self, forCellWithReuseIdentifier: destinationCollectionCell)
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor(named: "grey-light")
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        view.addSubview(collectionView ?? UICollectionView())
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Find Activity"
        self.navigationController?.navigationBar.barTintColor = .white
        
        let titleLabel = UILabel()
        let locationButton = UIButton()
        
        titleLabel.text = "Delivering to".uppercased()
        titleLabel.font = UIFont(name: "TTNorms-Bold", size: 10)
        titleLabel.textColor = UIColor(named: "red")
        
        locationButton.setTitle("Pie Guys Of New York", for: .normal)
        locationButton.setTitleColor(.black, for: .normal)
        locationButton.backgroundColor = .white
        locationButton.titleLabel?.font = UIFont(name: "TTNorms-Medium", size: 18)
        locationButton.addTarget(self, action: #selector(setLocation), for: .touchUpInside)
        locationButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        
        
        
        if let arrowDown = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate){
          locationButton.setImage(arrowDown, for: .normal)
            locationButton.tintColor = UIColor(named: "red")
        }
        
        locationButton.imageView?.contentMode = .scaleAspectFit
          locationButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10)
        
        locationButton.semanticContentAttribute = .forceRightToLeft
        
        let horizontalStackView = UIStackView(arrangedSubviews: [titleLabel, locationButton])
        horizontalStackView.alignment = .center
        horizontalStackView.axis = .vertical
        horizontalStackView.spacing = 0
        
        
        navigationItem.titleView = horizontalStackView
 
    }
    
    @objc func setLocation() {
        print("Hello")
    }
}

extension ActivityController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.item == 0 {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCollectionCell, for: indexPath) as! CategoryCollectionCell
            return cell
          } else if indexPath.item == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCollectionCell, for: indexPath) as! FilterCollectionCell
                          return cell
          } else if indexPath.item == 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredCollectionCell, for: indexPath) as!  FeaturedCollectionCell
                          return cell
          } else if indexPath.item == 3 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: destinationCollectionCell, for: indexPath) as! RestaurantCollectionCell
                          return cell
          }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCollectionCell, for: indexPath) as! CategoryCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width, height: 120)
        } else if indexPath.item == 1 {
              return CGSize(width: collectionView.frame.width, height: 80)
        } else if indexPath.item == 2 {
             return CGSize(width: collectionView.frame.width, height: 170)
        }

        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



