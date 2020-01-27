//
//  DeliveryCardCell.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryCardCellType {
    func configure(with model: DeliveryCardCellViewModel, index: Int, and collectionView: UICollectionView)
}

final class DeliveryCardCell: UICollectionViewCell {

    static let reuseIdentifier = "DeliveryCardCellReuseIdentifier"

    struct Constants {
        static let height: CGFloat = 120
        static let mainStackVerticalSpacing: CGFloat = 10.0
        static let requestsTitle = "Requests"
        static let pledgeTitle = "Pledge"
        static let weightTitle = "Weight"
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

    lazy var indexedDeadlineView: DeliveryBasicIndexedDeadlineView = {
        return DeliveryBasicIndexedDeadlineView()
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

    lazy var indexHorizontalStack: UIStackView = {
        let stack = getDefaultHorizontalStack()
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        return stack
    }()

    // MARK: - Internal methods

    func setupCellData(with model: DeliveryCardCellViewModel, and index: Int) {
        self.set(sourceAddress: model.sourceAddress)
        self.set(destinationAddress: model.destinationAddress)
        self.setupBottomStack(requests: model.numberOfRequests, pledge: model.pedge, weight: model.weight)
        self.setupIndexedWidget(with: model.deadline, and: index)
    }

    func setupMainStack() {
        mainStackView.addArrangedSubview(sourceAddressView)
        mainStackView.addArrangedSubview(destinationAddressView)
        mainStackView.addArrangedSubview(bottomStackView)
    }

    func setupBottomStack(requests: String, pledge: String, weight: String) {
        requestsKPI.configure(with: Constants.requestsTitle.uppercased(), and: requests)
        pledgeKPI.configure(with: Constants.pledgeTitle.uppercased(), and: requests)
        weightKPI.configure(with: Constants.weightTitle.uppercased(), and: weight)

        self.bottomStackView.addArrangedSubview(requestsKPI)
        self.bottomStackView.addArrangedSubview(pledgeKPI)
        self.bottomStackView.addArrangedSubview(weightKPI)
    }

    func setupIndexedWidget(with deadline: Date, and index: Int) {
        self.indexedDeadlineView.configure(with: String(describing: index), deadline: deadline)
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
    func configure(with model: DeliveryCardCellViewModel, index: Int, and collectionView: UICollectionView) {
        self.setupTheme(with: collectionView)
        self.setupMainStack()
        self.setupConstraints()
        self.setupCellData(with: model, and: index)
    }
}
