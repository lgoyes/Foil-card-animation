//
//  BaseDeliveryCardCell.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

class BaseDeliveryCardCell: UICollectionViewCell {
    
    struct Constants {
        static let mainStackVerticalSpacing: CGFloat = 10.0
    }
    
    lazy var containerView: UIView = {
        return UIView()
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = getDefaultVerticalStack()
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = Constants.mainStackVerticalSpacing
        return stack
    }()
    
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
    
    func setupTheme() {
        self.containerView.backgroundColor = .white
    }
    
    func setupMainStackConstraints() {
        containerView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
    }
}
