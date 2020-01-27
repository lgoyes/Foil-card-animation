//
//  DeliveryDetailKPIContainerView.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryDetailKPIContainerViewType {
    func configure(with requests: String, price: String, and weight: String)
}

final class DeliveryDetailKPIContainerView: UIView {

    // MARK: Outlets
    lazy var requestsKPI: DeliveryBasicKPIView = {
        return getDefaultKPI()
    }()

    lazy var pledgeKPI: DeliveryBasicKPIView = {
        return getDefaultKPI()
    }()

    lazy var weightKPI: DeliveryBasicKPIView = {
        return getDefaultKPI()
    }()

    // MARK: - Stack
    lazy var containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutMargins = UIEdgeInsets(top: 70, left: 10, bottom: 0, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    // MARK: - Internal methods
    func getDefaultKPI() -> DeliveryBasicKPIView {
        let kpi = DeliveryBasicKPIView()
        kpi.translatesAutoresizingMaskIntoConstraints = false
        kpi.titleLabel.textColor = .gray
        kpi.valueLabel.textColor = .white
        return kpi
    }
    
    func set(requests: String) {
        requestsKPI.configure(with: PresentationConstants.Delivery.requestsTitle, and: requests)
    }
    
    func set(price: String) {
        pledgeKPI.configure(with: PresentationConstants.Delivery.pledgeTitle, and: price)
    }
    
    func set(weight: String) {
        weightKPI.configure(with: PresentationConstants.Delivery.weightTitle, and: weight)
    }
    
    func setupContainerConstraints() {
        self.addSubview(containerStack)
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: self.topAnchor),
            containerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setContainerStack() {
        containerStack.addArrangedSubview(requestsKPI)
        containerStack.addArrangedSubview(pledgeKPI)
        containerStack.addArrangedSubview(weightKPI)
    }
    
    func setupTheme() {
        self.backgroundColor = .orange
    }
}

extension DeliveryDetailKPIContainerView: DeliveryDetailKPIContainerViewType {
    func configure(with requests: String, price: String, and weight: String) {
        self.set(requests: requests)
        self.set(price: price)
        self.set(weight: weight)
        self.setupContainerConstraints()
        self.setContainerStack()
        self.setupTheme()
    }
}
