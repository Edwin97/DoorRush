//
//  ReuseIdentifying.swift
//  DoorRush
//
//  Created by edwin on 16/06/2020.
//  Copyright © 2020 edwin. All rights reserved.
//

import Foundation

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
