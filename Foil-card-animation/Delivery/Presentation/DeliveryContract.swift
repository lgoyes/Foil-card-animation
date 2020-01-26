//
//  DeliveryContract.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

protocol DeliveryUIViewType: AnyObject {
    func set(adapter: DeliveryCardAdapter)
    func configure()
}

protocol DeliveryViewType: BaseViewType {
    func set(items: [DeliveryCardCellViewModel])
}

protocol DeliveryPresenterType: BasePresenterType {

}
