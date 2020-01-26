//
//  BaseViewController.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol BaseViewType: AnyObject {

}

class BaseViewController<PresenterType>: UIViewController, BaseViewType {

    var presenter: PresenterType!

    override func viewDidLoad() {
        super.viewDidLoad()
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        (presenter as? BasePresenterLifeCycleNotifiable)?.viewDidDisappear()
    }
}
