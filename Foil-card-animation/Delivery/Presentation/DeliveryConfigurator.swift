//
//  DeliveryConfigurator.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

final class DeliveryConfigurator {

    static func getModule() -> UIViewController {
        let presenter = DeliveryPresenter()
        presenter.dependencies = createDependencies()

        let viewController = DeliveryViewController(presenter: presenter)
        viewController.title = PresentationConstants.Delivery.title

        return viewController
    }

    static func createDependencies() -> DeliveryPresenter.InputDependencies {
        return DeliveryPresenter.InputDependencies(getDeliveriesInteractor: GetDeliveriesInteractor())
    }
}
