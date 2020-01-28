//
//  DeliveryDetailInformationItemView.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

struct DeliveryDetailKPI {
    let title: String
    let valueLarge: String
    let valueSmall: String?
}

protocol DeliveryDetailInformationItemViewType {
    func configure(with kpi: DeliveryDetailKPI)
}

final class DeliveryDetailInformationItemView: DeliveryBasicKPIView {
    lazy var smallValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(10.0)
        return label
    }()
    
    override func setupStack() {
        super.setupStack()
        self.stackView.addArrangedSubview(smallValueLabel)
    }
    
    func setupSmallValueLabel(with text: String) {
        self.smallValueLabel.text = text
    }
}

extension DeliveryDetailInformationItemView: DeliveryDetailInformationItemViewType {
    func configure(with kpi: DeliveryDetailKPI) {
        self.configure(with: kpi.title, and: kpi.valueLarge)
        if let smallValueText = kpi.valueSmall {
            self.setupSmallValueLabel(with: smallValueText)
        }
    }
}
