//
//  BaseCoordinator.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol BaseCoordinator {
    var childCoordinators: [BaseCoordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
