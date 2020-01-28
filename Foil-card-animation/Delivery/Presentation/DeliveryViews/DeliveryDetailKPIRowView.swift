//
//  DeliveryDetailKPIRowView.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryDetailKPIRowViewType {
    func configure(kpis: [DeliveryDetailKPI])
}

final class DeliveryDetailKPIRowView: UIView {
    
    struct Constants {
        static let height: CGFloat = 80.0
        static let verticalMargin: CGFloat = 10.0
    }
    
    let stackRow: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.layoutMargins = UIEdgeInsets(top: Constants.verticalMargin, left: 0, bottom: Constants.verticalMargin, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    func setupConstraints() {
        self.addSubview(stackRow)
        NSLayoutConstraint.activate([
            stackRow.topAnchor.constraint(equalTo: self.topAnchor),
            stackRow.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackRow.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackRow.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }

    func setupKPIChildren(with kpis: [DeliveryDetailKPI]) {
        kpis.forEach {
            let informationView = prepareInformationItemView(with: $0)
            stackRow.addArrangedSubview(informationView)
        }
    }

    func prepareInformationItemView(with kpi: DeliveryDetailKPI) -> DeliveryDetailInformationItemView {
        let informationView = DeliveryDetailInformationItemView()
        informationView.configure(with: kpi)
        return informationView
    }
}

extension DeliveryDetailKPIRowView: DeliveryDetailKPIRowViewType {
    func configure(kpis: [DeliveryDetailKPI]) {
        self.setupConstraints()
        self.setupKPIChildren(with: kpis)
    }
}
