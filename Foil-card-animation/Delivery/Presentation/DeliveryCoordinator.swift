//
//  DeliveryCoordinator.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

final class DeliveryCoordinator: BaseCoordinator {
    var childCoordinators: [BaseCoordinator] = []

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let module = DeliveryConfigurator.getModule()
        self.navigationController.pushViewController(module, animated: true)
    }
}
