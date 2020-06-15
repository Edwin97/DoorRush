//
//  FeaturedCollectionCell.swift
//  DoorRush
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class FeaturedCollectionCell: BaseCollectionCell {
    
    let featuredCell = "featuredCell"
    let features = ["featured-1","featured-2","featured-3"]
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = features.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(named: "grey-default")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "grey")
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = .white
        
//        addSubview(stackView)
        addSubview(collectionView)
              addSubview(pageControl)
//        addSubview(pageControl)
//
//        stackView.addArrangedSubview(collectionView)
//        stackView.addArrangedSubview(pageControl)

        collectionView.isPagingEnabled = true
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -10),
            
            collectionView.widthAnchor.constraint(equalToConstant: self.frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: 180),
            
            pageControl.leftAnchor.constraint(equalTo: leftAnchor),
            pageControl.rightAnchor.constraint(equalTo: rightAnchor),
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])

        collectionView.constraints.forEach { (constraints) in
            print("checked \(constraints.firstAnchor) \n")
        }
    }
    
    override func registerClass() {
        collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: featuredCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return features.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredCell, for: indexPath) as! FeaturedCell
        cell.imageName = features[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
     }
}
