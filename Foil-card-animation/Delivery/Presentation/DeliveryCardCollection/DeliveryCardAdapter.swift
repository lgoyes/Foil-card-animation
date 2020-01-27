//
//  DeliveryCardAdapter.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

protocol DeliveryCardAdapterManageable {
    func add(data: [DeliveryCardCellViewModel])
    func clearData()
    func attach(collectionView: UICollectionView)
}

final class DeliveryCardAdapter: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private struct Constants {
        static let numberOfSections = 1
        static let onlyValidSectionIndex = 0
        static let reuseIdentifier = "DeliveryCardCellReuseIdentifier"
    }

    var data: [DeliveryCardCellViewModel] = []

    var collectionView: UICollectionView!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        assert(section == Constants.onlyValidSectionIndex)
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionView = self.collectionView else {
            fatalError("Adapter's collectionView not set")
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeliveryCardCell.reuseIdentifier, for: indexPath) as? DeliveryCardCell else {
            fatalError("Impossible to dequeue a DeliveryCardCell")
        }

        cell.configure(with: data[indexPath.row], index: indexPath.row)

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width - 20.0, height: DeliveryCardCell.Constants.height)
    }
}

extension DeliveryCardAdapter: DeliveryCardAdapterManageable {
    func add(data: [DeliveryCardCellViewModel]) {
        self.data.append(contentsOf: data)
        collectionView?.reloadData()
    }

    func clearData() {
        self.data = []
        collectionView?.reloadData()
    }

    func attach(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.register(DeliveryCardCell.self, forCellWithReuseIdentifier: DeliveryCardCell.reuseIdentifier)
        collectionView.register(DeliveryCardDetailCell.self, forCellWithReuseIdentifier: DeliveryCardDetailCell.reuseIdentifier)
    }
}
