//
//  FliterCollectionCell.swift
//  Adventure App
//
//  Created by edwin on 03/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class FilterCollectionCell: BaseCollectionCell {
    
    let filterCell = "filterCell"
    let filters = ["Over 4.5 \u{f005} | \u{f107}", "Under 30 min", "Vegetarian", "$, $$ | \u{f107}"
    ]
    
    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = .white
    }
    
    override func registerClass() {
        collectionView.register(FilterCell.self, forCellWithReuseIdentifier: filterCell)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCell, for: indexPath) as! FilterCell
        cell.filter = filters[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4 - 16, height: frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
