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
        static let height: CGFloat = 50
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
    
    func setupCellData(with model: DeliveryCardCellViewModel, and index: Int) {
        self.setupHeader(index: index, price: model.pedge)
    }
    
    func setupHeader(index: Int, price: String) {
        headerView.configure(with: String(describing: index), and: price)
    }
}

extension DeliveryCardDetailCell: DeliveryCardCellType {
    func configure(with model: DeliveryCardCellViewModel, index: Int) {
        self.setupContainer()
        self.setupMainStackConstraints()
        self.setupMainStack()
        self.setupCellData(with: model, and: index)
        self.setupTheme()
    }
}

