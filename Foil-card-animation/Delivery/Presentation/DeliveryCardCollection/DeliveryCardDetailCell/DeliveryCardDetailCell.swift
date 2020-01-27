//
//  DeliveryCardDetailCell.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryCardDetailCellType {
    func configure(with model: DeliveryCardCellViewModel, index: Int)
}

final class DeliveryCardDetailCell: BaseDeliveryCardCell {

    static let reuseIdentifier = "DeliveryCardDetailCellReuseIdentifier"

    struct Constants {
        static let height: CGFloat = 300
    }

    // MARK: - Outlets
    lazy var headerView: DeliveryDetailHeaderView = {
        let header = DeliveryDetailHeaderView()
        return header
    }()

    // MARK: - StackViews

    // MARK: - Internal methods
    func setupMainStack() {
        mainStackView.addArrangedSubview(headerView)
    }
}

extension DeliveryCardDetailCell: DeliveryCardDetailCellType {
    func configure(with model: DeliveryCardCellViewModel, index: Int) {
        self.setupContainer()
        self.setupMainStackConstraints()
        self.setupMainStack()
        self.setupTheme()
    }
}

