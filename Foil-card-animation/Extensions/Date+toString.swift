//
//  Date+toString.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

extension Date {
    func toString(with format: String) -> String {
        let format = DateFormatter()
        format.dateFormat = String(describing: format)
        return format.string(from: self)
    }
}
