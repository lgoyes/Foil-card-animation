//
//  DeliveryPresenter.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

final class DeliveryPresenter: BasePresenter<DeliveryViewType, DeliveryViewController>, DeliveryPresenterType {
    
    struct Constants {
        static let sourceAddress = "W 90th St. New York. 100225"
        static let destinationAddress = "E 30th St. New York 10016"
        static let numberOfRequests = "2"
        static let pedge = "150"
        static let weight = "light"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDeliveryItems()
    }
    
    func getDeliveryItems() {
        let item = DeliveryCardCellViewModel(
            sourceAddress: Constants.sourceAddress,
            destinationAddress: Constants.destinationAddress,
            numberOfRequests: Constants.numberOfRequests,
            pedge: Constants.pedge,
            weight: Constants.weight,
            deadline: Date(),
            type: .master)
        self.view.set(items: [DeliveryCardCellViewModel].init(repeating: item, count: 20))
    }
}
