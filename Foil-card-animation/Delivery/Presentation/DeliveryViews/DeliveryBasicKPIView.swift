//
//  DeliveryBasicKPIView.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryBasicKPIViewType {
    func configure(with title: String, and value: String)
}

class DeliveryBasicKPIView: UIView {
    // MARK: Outlets
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Stack
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Internal Methods
    func setupStack() {
        self.stackView.addArrangedSubview(titleLabel)
        self.stackView.addArrangedSubview(valueLabel)
    }

    func setupConstraints() {
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }

    func setupTitle(with text: String) {
        self.titleLabel.text = text
    }

    func setupValue(with text: String) {
        self.valueLabel.text = text
    }
}

extension DeliveryBasicKPIView: DeliveryBasicKPIViewType {
    func configure(with title: String, and value: String) {
        self.setupStack()
        self.setupConstraints()
        self.setupTitle(with: title)
        self.setupValue(with: value)
    }
}
