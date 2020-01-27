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
        static let height: CGFloat = 140
        static let mainStackVerticalSpacing: CGFloat = 10.0
        static let requestsTitle = "Requests"
        static let pledgeTitle = "Pledge"
        static let weightTitle = "Weight"
        static let todayTitle = "Today"
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

    lazy var deadlineKPI: DeliveryBasicKPIView = {
        return DeliveryBasicKPIView()
    }()

    lazy var indexLabel: UILabel = {
        let label = getDefaultLabel()
        label.textAlignment = .center
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - StackViews
    lazy var bottomStackView: UIStackView = {
        let stack = getDefaultHorizontalStack()
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    lazy var topStackView: UIStackView = {
        let stack = getDefaultHorizontalStack()
        stack.alignment = .center
        stack.spacing = 10.0
        stack.distribution = .fillProportionally
        stack.layoutMargins = UIEdgeInsets(top: 20, left: 0, bottom: 00, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()

    lazy var mainStackView: UIStackView = {
        let stack = getDefaultVerticalStack()
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = Constants.mainStackVerticalSpacing
        return stack
    }()

    lazy var addressContainerStackView: UIStackView = {
        let stackView = getDefaultVerticalStack()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10.0
        return stackView
    }()
    
    // MARK: - Container
    
    lazy var containerView: UIView = {
        let view = UIView()
        
        return view
    }()

    // MARK: - Internal methods

    func setupCellData(with model: DeliveryCardCellViewModel, and index: Int) {
        self.setupTopStack(index: index, sourceAddress: model.sourceAddress, destinationAddress: model.destinationAddress)
        self.setupBottomStack(deadline: model.deadline, requests: model.numberOfRequests, pledge: model.pedge, weight: model.weight)
    }

    func setupMainStack() {
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(bottomStackView)
    }

    func setupTopStack(index: Int, sourceAddress: String, destinationAddress: String) {
        indexLabel.text = String(describing: index)
        self.set(sourceAddress: sourceAddress)
        self.set(destinationAddress: destinationAddress)

        addressContainerStackView.addArrangedSubview(sourceAddressView)
        addressContainerStackView.addArrangedSubview(destinationAddressView)

        topStackView.addArrangedSubview(indexLabel)
        topStackView.addArrangedSubview(addressContainerStackView)

        NSLayoutConstraint.activate([
            addressContainerStackView.widthAnchor.constraint(equalTo: indexLabel.widthAnchor, multiplier: 3.0)
            ])
    }

    func setupBottomStack(deadline: Date, requests: String, pledge: String, weight: String) {
        deadlineKPI.configure(with: getDateText(from: deadline), and: getTimeText(from: deadline))
        requestsKPI.configure(with: Constants.requestsTitle.uppercased(), and: requests)
        pledgeKPI.configure(with: Constants.pledgeTitle.uppercased(), and: requests)
        weightKPI.configure(with: Constants.weightTitle.uppercased(), and: weight)

        self.bottomStackView.addArrangedSubview(deadlineKPI)
        self.bottomStackView.addArrangedSubview(requestsKPI)
        self.bottomStackView.addArrangedSubview(pledgeKPI)
        self.bottomStackView.addArrangedSubview(weightKPI)
    }

    func setupConstraints() {
        containerView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
    }
    
    func setupContainer() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ])
        
        containerView.layer.cornerRadius = 20.0
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.clear.cgColor
        containerView.layer.masksToBounds = true
    }

    func set(sourceAddress: String) {
        self.sourceAddressView.configure(with: sourceAddress)
    }

    func set(destinationAddress: String) {
        self.destinationAddressView.configure(with: destinationAddress)
    }

    func setupTheme() {
        self.containerView.backgroundColor = .orange
        self.deadlineKPI.backgroundColor = .red
        self.indexLabel.backgroundColor = .red
    }

    func getDateText(from date: Date) -> String {
        if isToday(date) {
            return Constants.todayTitle.uppercased()
        } else {
            let format = DateFormatter()
            format.dateFormat = "MMM dd, yyyy"
            return format.string(from: date)
        }
    }

    func getTimeText(from date: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "h:mm a"
        return format.string(from: date)
    }

    func isToday(_ date: Date) -> Bool {
        return Calendar.current.isDateInToday(date)
    }
}

extension DeliveryCardCell: DeliveryCardCellType {
    func configure(with model: DeliveryCardCellViewModel, index: Int, and collectionView: UICollectionView) {
        self.setupContainer()
        self.setupMainStack()
        self.setupConstraints()
        self.setupCellData(with: model, and: index)
        self.setupTheme()
    }
}
