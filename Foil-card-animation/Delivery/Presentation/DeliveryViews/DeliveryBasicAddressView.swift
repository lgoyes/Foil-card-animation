//
//  DeliveryBasicAddressView.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryBasicAddressViewType {
    func configure(with address: String)
}

final class DeliveryBasicAddressView: UIView {
    // MARK: Outlets
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var widgetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 5.0
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.backgroundColor = UIColor.white
        return imageView
    }()

    // MARK: - Stack
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Internal Methods
    func setupStack() {
        self.stackView.addArrangedSubview(widgetImageView)
        self.stackView.addArrangedSubview(addressLabel)
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

    func setupAddress(with text: String) {
        self.addressLabel.text = text
    }
}

extension DeliveryBasicAddressView: DeliveryBasicAddressViewType {
    func configure(with address: String) {
        self.setupStack()
        self.setupConstraints()
        self.setupAddress(with: address)
    }
}
