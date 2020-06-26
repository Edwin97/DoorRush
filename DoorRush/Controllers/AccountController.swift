//
//  AccountController.swift
//  DoorRush
//
//  Created by edwin on 06/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit
import Firebase

class AccountController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        navigationItem.title = "Account"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.backgroundColor = .white
        
        navigationController?.navigationBar.setCustomFont()
    }
    
    func registerCell() {
        collectionView.register(AccountSwitchCell.self, forCellWithReuseIdentifier: AccountSwitchCell.reuseIdentifier)
        collectionView.register(AccountDescriptionCell.self, forCellWithReuseIdentifier: AccountDescriptionCell.reuseIdentifier)
        collectionView.register(AccountBasicCell.self, forCellWithReuseIdentifier: AccountBasicCell.reuseIdentifier)
        collectionView.register(AccountHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AccountHeaderCell.reuseIdentifier)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        if isAnonynous() {
            collectionView.setAnonymousView(iconImage: "anonymous-setting", title: "Let's get rushing!", message: "Sign in to manage your setting", buttonTitle: "Sign Up to View Settings")
            return 0
        } else {
            collectionView.restore()
        }
        
        return AccountSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize.zero
        }
        
        return CGSize(width: collectionView.frame.width, height: 80)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if indexPath.item == 0 {
            UICollectionReusableView()
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AccountHeaderCell.reuseIdentifier, for: indexPath) as! AccountHeaderCell
        headerView.headerLabel.text = AccountSection(rawValue: indexPath.section)?.description
          return headerView
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
        return CGSize(width: view.frame.width, height: 58)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let basicCell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountBasicCell.reuseIdentifier, for: indexPath) as! AccountBasicCell
        let descriptionCell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountDescriptionCell.reuseIdentifier, for: indexPath) as! AccountDescriptionCell
        let switchCell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountSwitchCell.reuseIdentifier, for: indexPath) as! AccountSwitchCell
        
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 && indexPath.item == 1 {
            logout()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func logout() {
        
        let actionSheetController: UIAlertController = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .actionSheet)
        
        // create an action
        let firstAction: UIAlertAction = UIAlertAction(title: "Logout", style: .destructive) { action -> Void in
            
            do {
                try Auth.auth().signOut()
            } catch {
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        }

        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }

        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(cancelAction)

        present(actionSheetController, animated: true) {
            print("option menu presented")
        }
    }
}
