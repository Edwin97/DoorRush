//
//  User.swift
//  DoorRush
//
//  Created by edwin on 26/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import Foundation

struct User: Decodable {
    var userId: String
    var username: String?
    var email: String?
    var phoneNumber: String?
}
