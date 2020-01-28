//
//  Address.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

struct Address {
    let address: String
    let addressComplement: String
}

extension Address {
    func toString() -> String {
        return "\(address). \(addressComplement)"
    }
}
