
//
//  DeliveryBasicIndexedDeadlineView.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryBasicIndexedDeadlineViewType {
    func configure(with index: String, deadline: Date)
}

final class DeliveryBasicIndexedDeadlineView: UIView {
    struct Constants {
        static let today = "Today"
    }
    
    // MARK: Outlets
    lazy var indexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Stack
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12.0
        return stackView
    }()

    // MARK: - Internal Methods
    func setupStack() {
        self.stackView.addArrangedSubview(indexLabel)
        self.stackView.addArrangedSubview(dateLabel)
        self.stackView.addArrangedSubview(timeLabel)
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

    func setupIndex(with text: String) {
        self.indexLabel.text = text
    }

    func setupDate(with text: String) {
        self.dateLabel.text = text
    }

    func setupTime(with text: String) {
        self.timeLabel.text = text
    }
    
    func getDateText(from date: Date) -> String {
        if isToday(date) {
            return Constants.today
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

extension DeliveryBasicIndexedDeadlineView: DeliveryBasicIndexedDeadlineViewType {
    func configure(with index: String, deadline: Date) {
        self.setupStack()
        self.setupConstraints()
        self.setupIndex(with: index)
        self.setupDate(with: getDateText(from: deadline))
        self.setupTime(with: getTimeText(from: deadline))
    }
}
