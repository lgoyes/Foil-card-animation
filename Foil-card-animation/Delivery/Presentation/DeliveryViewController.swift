//
//  DeliveryViewController.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

final class DeliveryViewController: BaseViewController<DeliveryPresenterType> {
    var uiView: DeliveryUIViewType! {
        self.view as? DeliveryUIViewType
    }

    // MARK: - Initializers
    init(presenter: DeliveryPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter.bind(view: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = DeliveryUIView()
    }
}
