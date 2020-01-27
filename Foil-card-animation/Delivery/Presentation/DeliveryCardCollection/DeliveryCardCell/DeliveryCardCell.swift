//
//  DeliveryCardCell.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryCardCellType {
    func configure(with model: DeliveryCardCellViewModel, index: Int)
}

final class DeliveryCardCell: BaseDeliveryCardCell {

    static let reuseIdentifier = "DeliveryCardCellReuseIdentifier"

    struct Constants {
        static let height: CGFloat = 140
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
        let kpi = DeliveryBasicKPIView()
        kpi.titleLabel.textColor = .white
        kpi.valueLabel.textColor = .white
        return kpi
    }()

    lazy var indexLabel: UILabel = {
        let label = getDefaultLabel()
        label.textAlignment = .center
        label.font = label.font.withSize(25.0)
        label.textColor = .white
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

    lazy var addressContainerStackView: UIStackView = {
        let stackView = getDefaultVerticalStack()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10.0
        return stackView
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

    func set(sourceAddress: String) {
        self.sourceAddressView.configure(with: sourceAddress)
    }

    func set(destinationAddress: String) {
        self.destinationAddressView.configure(with: destinationAddress)
    }

    override func setupTheme() {
        super.setupTheme()
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(rgb: PresentationConstants.Delivery.accentColor)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        containerView.insertSubview(backgroundView, at: 0)
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: containerView.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            backgroundView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.25)
        ])
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
    func configure(with model: DeliveryCardCellViewModel, index: Int) {
        self.setupContainer()
        self.setupMainStack()
        self.setupMainStackConstraints()
        self.setupCellData(with: model, and: index)
        self.setupTheme()
    }
}
