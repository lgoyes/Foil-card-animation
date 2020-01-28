//
//  DeliveryCardDetailCell.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

final class DeliveryCardDetailCell: BaseDeliveryCardCell {

    static let reuseIdentifier = "DeliveryCardDetailCellReuseIdentifier"

    struct Constants {
        static let height: CGFloat = DeliveryDetailHeaderView.Constants.height + DeliveryDetailKPIContainerView.Constants.height + DeliveryDetailKPIRowView.Constants.height * 2
        static let from: String = "From"
        static let to: String = "To"
        static let deliveryDate: String = "Delivery date"
        static let requestDeadline: String = "Request deadline"
    }

    // MARK: - Outlets
    lazy var headerView: DeliveryDetailHeaderView = {
        let header = DeliveryDetailHeaderView()
        return header
    }()

    lazy var kpiContainer: DeliveryDetailKPIContainerView = {
        let kpiContainer = DeliveryDetailKPIContainerView()
        return kpiContainer
    }()

    lazy var addressInformationView: DeliveryDetailKPIRowView = {
        let addressInformationView = DeliveryDetailKPIRowView()
        return addressInformationView
    }()
    
    lazy var deadlineInformationView: DeliveryDetailKPIRowView = {
        let deadlineInformationView = DeliveryDetailKPIRowView()
        return deadlineInformationView
    }()

    // MARK: - StackViews

    // MARK: - Internal methods
    func setupMainStack() {
        mainStackView.addArrangedSubview(headerView)
        mainStackView.addArrangedSubview(kpiContainer)
        mainStackView.addArrangedSubview(addressInformationView)
        mainStackView.addArrangedSubview(deadlineInformationView)
    }

    func setupCellData(with model: DeliveryCardCellViewModel, and index: Int) {
        self.setupHeader(index: index, price: model.pedge)
        self.setupKPIContainer(with: model.numberOfRequests, pledge: model.pedge, and: model.weight)
        self.setupAddressInformationView(with: model.sourceAddress, and: model.destinationAddress)
        self.setupDeadlineView(with: model.deadline, and: "23min")
    }

    func setupHeader(index: Int, price: String) {
        headerView.configure(with: String(describing: index), and: price)
    }

    func setupKPIContainer(with requests: String, pledge: String, and weight: String) {
        kpiContainer.configure(with: requests, price: pledge, and: weight)
    }

    func setupAddressInformationView(with source: Address, and destination: Address) {
        addressInformationView.configure(kpis: [
            DeliveryDetailKPI(
                title: Constants.from.uppercased(),
                valueLarge: source.address,
                valueSmall: source.addressComplement),
            DeliveryDetailKPI(
                title: Constants.to.uppercased(),
                valueLarge: destination.address,
                valueSmall: destination.addressComplement)
            ])
    }
    
    func setupDeadlineView(with deliveryDate: Date, and requestDeadline: String) {
        deadlineInformationView.configure(kpis: [
            DeliveryDetailKPI(
                title: Constants.deliveryDate.uppercased(),
                valueLarge: deliveryDate.toString(with: "h:mm a"),
                valueSmall: deliveryDate.toString(with: "MMM dd, yyyy")),
            DeliveryDetailKPI(
                title: Constants.requestDeadline.uppercased(),
                valueLarge: requestDeadline,
                valueSmall: nil)
            ])
    }

    func overrideMainStack() {
        self.mainStackView.spacing = 0.0
    }
}

extension DeliveryCardDetailCell: DeliveryCardCellType {
    func configure(with model: DeliveryCardCellViewModel, index: Int) {
        self.setupContainer()
        self.overrideMainStack()
        self.setupMainStackConstraints()
        self.setupMainStack()
        self.setupCellData(with: model, and: index)
        self.setupTheme()
    }
}

