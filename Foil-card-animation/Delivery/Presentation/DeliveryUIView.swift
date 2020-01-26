//
//  DeliveryUIView.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

final class DeliveryUIView: UIView {

    lazy var viewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.viewLayout)
        collectionView.backgroundColor = .yellow
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    weak var adapter: DeliveryCardAdapter?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK - Internal methods
    func setupConstraints() {
        self.setupCollectionView()
    }

    func setupCollectionView() {
        self.addSubview(collectionView)
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 10),
            self.collectionView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -10),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
    }
}

extension DeliveryUIView: DeliveryUIViewType {
    func configure() {
        setupConstraints()
    }

    func set(adapter: DeliveryCardAdapter) {
        self.adapter = adapter
        self.adapter?.attach(collectionView: self.collectionView)
        collectionView.delegate = self.adapter
        collectionView.dataSource = self.adapter
    }
}
