//
//  DateComponents+toDate.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

extension DateComponents {
    func toDate() -> Date? {
        return Calendar.current.date(from: self)
    }
}
