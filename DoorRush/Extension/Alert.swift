//
//  Alert.swift
//  DoorRush
//
//  Created by edwin on 24/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UITextField {
    
    var isEmpty: Bool {
        if let _ = self.text, self.text!.isEmpty {
            return false
        }
        return true
    }
}
