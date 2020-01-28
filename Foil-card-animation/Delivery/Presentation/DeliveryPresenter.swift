//
//  DeliveryPresenter.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

final class DeliveryPresenter: BasePresenter<DeliveryViewType, DeliveryViewController>, DeliveryPresenterType {

    struct InputDependencies {
        let getDeliveriesInteractor: BaseInteractor<[DeliveryCardCellViewModel], Void>
    }

    var dependencies: InputDependencies!

    override func viewDidLoad() {
        super.viewDidLoad()
        getDeliveryItems()
    }

    func getDeliveryItems() {
        dependencies
            .getDeliveriesInteractor
            .set { [weak self] (deliveryItems) in
                self?.view.set(items: deliveryItems)
            }
            .set(onError: { error in
                self.handleException(error)
            })
            .execute()
    }
}
