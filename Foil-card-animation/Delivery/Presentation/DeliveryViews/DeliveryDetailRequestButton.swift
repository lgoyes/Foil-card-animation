//
//  DeliveryDetailRequestButton.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/27/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryDetailRequestButtonType {
    func configure(currentRequests: Int)
}

final class DeliveryDetailRequestButton: UIView {

    struct Constants {
        static let placeHolder = "{PLACE_HOLDER}"
        static let verbiage = "{PLACE_HOLDER} people have send a request"
        static let requestTitle = "Request"
        static let buttonCornerRadius: CGFloat = 7.0
        static let height: CGFloat = 90
        static let spacing: CGFloat = 5
    }

    // MARK: - Outlets
    lazy var requestButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(rgb: 0xFEC017)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.setTitle(Constants.requestTitle.uppercased(), for: .normal)
        return button
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(12.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Stackview
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = Constants.spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 20, right: 30)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    // MARK: - Internal methods
    func setupMainStackView() {
        mainStackView.addArrangedSubview(requestButton)
        mainStackView.addArrangedSubview(subtitleLabel)
    }

    func setupContraints() {
        self.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainStackView.heightAnchor.constraint(equalToConstant: Constants.height)
        ])
    }
    
    func set(currentRequests: Int) {
        self.subtitleLabel.text = Constants.verbiage.replacingOccurrences(of: Constants.placeHolder, with: String(describing: currentRequests))
    }
}

extension DeliveryDetailRequestButton: DeliveryDetailRequestButtonType {
    func configure(currentRequests: Int) {
        self.setupMainStackView()
        self.setupContraints()
        self.set(currentRequests: currentRequests)
    }
}
