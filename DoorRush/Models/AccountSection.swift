//
//  AccountSection.swift
//  DoorRush
//
//  Created by edwin on 08/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import Foundation

enum AccountSection: Int, CaseIterable, CustomStringConvertible {
    case account
    case notification
    case more
    
    var description: String {
        switch self {
        case .account:
            return "Account"
        case .notification:
            return "Notifications"
        case .more:
            return "More"
        }
    }
}

enum AccountOption: Int, CaseIterable, CustomStringConvertible {
    case account
    case payment
    case addresses
    case Policy
    
    var description: String {
        switch self {
        case .account:
            return "Acount"
        case .payment:
            return "Payment"
        case .addresses:
            return "Addresses"
        case .Policy:
            return "Privacy"
        }
    }
}

enum NotificationOption: Int, CaseIterable, CustomStringConvertible {
    case deliveryPushNotification
    case deliverySMSNotification
    case promotionalPushNotification
    
    var description: String {
        switch self {
        case .deliveryPushNotification:
            return "Delivery Push Notification"
        case .deliverySMSNotification:
            return "Delivery SMS Notification"
        case .promotionalPushNotification:
            return "Promotional Push Notification"
        }
    }
}

enum MoreOption: Int, CaseIterable, CustomStringConvertible {
    case dasher
    case logout
    
    var description: String {
        switch  self {
        case .dasher:
            return "Become a Dasher"
        case .logout:
            return "Log Out"
        }
    }
}
