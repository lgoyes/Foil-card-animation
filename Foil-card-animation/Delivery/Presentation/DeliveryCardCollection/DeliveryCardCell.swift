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
    
    struct Constants {
        static let height: CGFloat = 120
        static let mainStackVerticalSpacing: CGFloat = 10.0
    }

    // MARK: - Outlets
    lazy var sourceAddressView: DeliveryBasicAddressView = {
        return DeliveryBasicAddressView()
    }()
    
    lazy var destinationAddressView: DeliveryBasicAddressView = {
        return DeliveryBasicAddressView()
    }()

    lazy var requestsKPI: DeliveryBasicKPIView = {
        return DeliveryBasicKPIView()
    }()

    lazy var pledgeKPI: DeliveryBasicKPIView = {
        return DeliveryBasicKPIView()
    }()

    lazy var weightKPI: DeliveryBasicKPIView = {
        return DeliveryBasicKPIView()
    }()

    // MARK: - StackViews
    lazy var bottomStackView: UIStackView = {
        let stack = getDefaultHorizontalStack()
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()

    lazy var mainStackView: UIStackView = {
        let stack = getDefaultVerticalStack()
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = Constants.mainStackVerticalSpacing
        return stack
    }()

    // MARK: - Internal methods

    func setupCellData(with model: DeliveryCardCellViewModel) {
        self.set(sourceAddress: model.sourceAddress)
        self.set(destinationAddress: model.destinationAddress)
    }

    func setupMainStack() {
        mainStackView.addArrangedSubview(sourceAddressView)
        mainStackView.addArrangedSubview(destinationAddressView)
        mainStackView.addArrangedSubview(bottomStackView)
    }

    func setupBottomStack(requests: String, pledge: String, weight: String) {
        requestsKPI.configure(with: "Requests", and: requests)
        pledgeKPI.configure(with: "Pledge", and: requests)
        weightKPI.configure(with: "Weight", and: weight)
        
        self.bottomStackView.addArrangedSubview(requestsKPI)
        self.bottomStackView.addArrangedSubview(pledgeKPI)
        self.bottomStackView.addArrangedSubview(weightKPI)
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
        self.sourceAddressView.configure(with: sourceAddress)
    }

    func set(destinationAddress: String) {
        self.destinationAddressView.configure(with: destinationAddress)
    }

    func setupTheme(with collectionView: UICollectionView) {
        self.backgroundColor = .red
    }
}

extension DeliveryCardCell: DeliveryCardCellType {
    func configure(with model: DeliveryCardCellViewModel, and collectionView: UICollectionView) {
        self.setupTheme(with: collectionView)
        self.setupBottomStack(requests: model.numberOfRequests, pledge: model.pedge, weight: model.weight)
        self.setupMainStack()
        self.setupConstraints()
        self.setupCellData(with: model)
    }
}
