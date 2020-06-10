//
//  AccountController.swift
//  DoorRush
//
//  Created by edwin on 06/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

class AccountController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let accountSwitchCell = "accountSwitchCell"
    let accountDescriptionCell = "accountDescriptionCell"
    let accountBasicCell = "accountBasicCell"
    let accountHeaderCell = "accountHeaderCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        navigationItem.title = "Account"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionView.backgroundColor = .white
    }
    
    func registerCell() {
        collectionView.register(AccountSwitchCell.self, forCellWithReuseIdentifier: accountSwitchCell)
        collectionView.register(AccountDescriptionCell.self, forCellWithReuseIdentifier: accountDescriptionCell)
        collectionView.register(AccountBasicCell.self, forCellWithReuseIdentifier: accountBasicCell)
        collectionView.register(AccountHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: accountHeaderCell)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return AccountSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: accountHeaderCell, for: indexPath) as! AccountHeaderCell
        headerView.headerLabel.text = AccountSection(rawValue: indexPath.section)?.description
          return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = AccountSection(rawValue: section) else {
            return 0
        }
        
        switch section {
        case .account:
            return AccountOption.allCases.count
        case .notification:
            return NotificationOption.allCases.count
        case .more:
            return MoreOption.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 48)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let basicCell = collectionView.dequeueReusableCell(withReuseIdentifier: accountBasicCell, for: indexPath) as! AccountBasicCell
        let descriptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: accountDescriptionCell, for: indexPath) as! AccountDescriptionCell
        let switchCell = collectionView.dequeueReusableCell(withReuseIdentifier: accountSwitchCell, for: indexPath) as! AccountSwitchCell
        
        guard let section = AccountSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch section {
        case .account:
            descriptionCell.titleLabel.text = AccountOption(rawValue: indexPath.row)?.description
            return descriptionCell
        case .notification:
            switchCell.titleLabel.text = NotificationOption(rawValue: indexPath.row)?.description
            return switchCell
        case .more:
            basicCell.titleLabel.text = MoreOption(rawValue: indexPath.row)?.description
            return basicCell
        }
    }
    
}
