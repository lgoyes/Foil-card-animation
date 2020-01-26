//
//  DeliveryCardCell+Builder.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

extension DeliveryCardCell {
    func getDefaultLabel() -> UILabel {
        return UILabel()
    }
    
    func getDefaultVerticalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }
    
    func getDefaultHorizontalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }
}
