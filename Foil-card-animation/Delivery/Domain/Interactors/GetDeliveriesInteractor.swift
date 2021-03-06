//
//  GetDeliveriesInteractor.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

class GetDeliveriesInteractor: BaseInteractor<[DeliveryCardCellViewModel], Void> {
    struct Constants {
        static let sourceAddress = Address(
            address: "W 90th St",
            addressComplement: "New York. 100225")
        static let destinationAddress = Address(
            address: "E 30th St",
            addressComplement: "New York 10016")
        static let numberOfRequests = "2"
        static let pedge = "150"
        static let weight = "light"
    }
    
    override func buildUseCase() {
        var dateComponents = DateComponents()
        dateComponents.day = 28
        dateComponents.month = 1
        dateComponents.year = 2020
        dateComponents.hour = 5
        dateComponents.minute = 30
        
        guard let date = dateComponents.toDate() else {
            fatalError("Invalid date")
        }
        
        let item = DeliveryCardCellViewModel(
            sourceAddress: Constants.sourceAddress,
            destinationAddress: Constants.destinationAddress,
            numberOfRequests: Constants.numberOfRequests,
            pedge: Constants.pedge,
            weight: Constants.weight,
            deadline: date,
            type: .master)
        
        onSuccess?(
            [DeliveryCardCellViewModel].init(repeating: item, count: 20)
        )
    }
}
