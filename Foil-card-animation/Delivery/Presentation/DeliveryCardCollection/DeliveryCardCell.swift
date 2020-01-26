//
//  DeliveryCardCell.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryCardCellType {
    func configure(with model: DeliveryCardCellViewModel, and collectionView: UICollectionView)
}

final class DeliveryCardCell: UICollectionViewCell {

    static let reuseIdentifier = "DeliveryCardCellReuseIdentifier"

    lazy var sourceAddressLabel: UILabel = {
        return getDefaultLabel()
    }()

    lazy var destinationAddressLabel: UILabel = {
        return getDefaultLabel()
    }()

    lazy var mainStackView: UIStackView = {
        return getDefaultVerticalStack()
    }()

    // MARK: - Internal methods

    func setupCellData(with model: DeliveryCardCellViewModel) {
        self.set(sourceAddress: model.sourceAddress)
        self.set(destinationAddress: model.destinationAddress)
    }

    func setupMainStack() {
        mainStackView.addArrangedSubview(sourceAddressLabel)
        mainStackView.addArrangedSubview(destinationAddressLabel)
    }

    func setupConstraints() {
        self.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
    }

    func set(sourceAddress: String) {
        self.sourceAddressLabel.text = sourceAddress
    }

    func set(destinationAddress: String) {
        self.destinationAddressLabel.text = destinationAddress
    }

    func setupTheme(with collectionView: UICollectionView) {
        self.backgroundColor = .red
    }
}

extension DeliveryCardCell: DeliveryCardCellType {
    func configure(with model: DeliveryCardCellViewModel, and collectionView: UICollectionView) {
        self.setupTheme(with: collectionView)
        self.setupMainStack()
        self.setupConstraints()
        self.setupCellData(with: model)
    }
}
