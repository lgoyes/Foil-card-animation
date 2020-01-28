//
//  Date+toString.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

extension Date {
    func toString(with formatString: String) -> String {
        let format = DateFormatter()
        format.dateFormat = formatString
        return format.string(from: self)
    }
}
