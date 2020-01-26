//
//  BasePresenter.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import Foundation

protocol BasePresenterLifeCycleNotifiable {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

protocol BasePresenterType: AnyObject, BasePresenterLifeCycleNotifiable {
    associatedtype View
    var view: View! { get }

    func bind<BindableView: BaseViewType>(view: BindableView)
    func handleException(_ error: Error)
}

class BasePresenter<ViewType, ViewController: AnyObject>: BasePresenterType {
    typealias View = ViewType
    
    private unowned var viewController: ViewController!
    
    var view: ViewType! {
        return viewController as? ViewType
    }

    public func bind<BindableView>(view: BindableView)
    where BindableView: BaseViewType {
        self.viewController = view as? ViewController
    }

    func viewDidLoad() {
        // This method can be overriden
    }

    func viewWillAppear() {
        // This method can be overriden
    }

    func viewDidAppear() {
        // This method can be overriden
    }

    func viewWillDisappear() {
        // This method can be overriden
    }

    func viewDidDisappear() {
        // This method can be overriden
    }
    
    func handleException(_ error: Error) {
        print(error.localizedDescription)
    }
}
