//
//  DeliveryDetailHeaderView.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryDetailHeaderViewType {
    func configure(with index: String, and price: String)
}

final class DeliveryDetailHeaderView: UIView {
    // MARK: Outlets
    lazy var indexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18.0)
        label.textColor = .white
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(18.0)
        label.textColor = .white
        return label
    }()

    lazy var navButton: NavButton = {
        let button = NavButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Stack

    lazy var containerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    // MARK: - Internal methods
    func setupIndexLabel(with index: String) {
        self.indexLabel.text = index
    }

    func setupPriceLabel(with price: String) {
        self.priceLabel.text = price
    }

    func configureContainerStackView() {
        containerStack.addArrangedSubview(navButton)
        containerStack.addArrangedSubview(indexLabel)
        containerStack.addArrangedSubview(priceLabel)
    }

    func setContainerStackConstraints() {
        self.addSubview(containerStack)
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: self.topAnchor),
            containerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }

    func setupTheme() {
        self.backgroundColor = UIColor(rgb: PresentationConstants.Delivery.accentColor)
    }
}

extension DeliveryDetailHeaderView: DeliveryDetailHeaderViewType {
    func configure(with index: String, and price: String) {
        self.setupTheme()
        self.setContainerStackConstraints()
        self.configureContainerStackView()
        self.setupIndexLabel(with: index)
        self.setupPriceLabel(with: price)
    }
}
