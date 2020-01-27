//
//  DeliveryCardCellViewModel.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

enum DeliveryCardViewModelType {
    case master
    case detail
}

extension DeliveryCardViewModelType {
    func toggle() -> DeliveryCardViewModelType {
        if case DeliveryCardViewModelType.master = self {
            return .detail
        } else {
            return .master
        }
    }
}

struct DeliveryCardCellViewModel {
    let sourceAddress: String
    let destinationAddress: String
    let numberOfRequests: String
    let pedge: String
    let weight: String
    let deadline: Date
    var type: DeliveryCardViewModelType
}
