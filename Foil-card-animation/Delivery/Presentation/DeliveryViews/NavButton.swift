//
//  NavButton.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

// Based on: https://stackoverflow.com/a/34411733

import UIKit

class NavButton: UIButton {

    override func draw(_ rect: CGRect) {
        let lineWidth: CGFloat = 1.0
        let lineLenght: CGFloat = min(bounds.width, bounds.height) * 0.8
        let lineColor: UIColor = UIColor.white
        let gap: CGFloat = bounds.height / 4

        for lineNumber in 0...2 {
            let linePath = UIBezierPath()
            linePath.lineWidth = lineWidth
            linePath.move(to:
                    CGPoint(
                        x: bounds.width / 2.0 - lineLenght / 2.0,
                        y: gap * CGFloat(lineNumber + 1)))

            linePath.addLine(to:
                    CGPoint(
                        x: bounds.width / 2.0 + lineLenght / 2.0,
                        y: gap * CGFloat(lineNumber + 1)))

            lineColor.setStroke()
            linePath.stroke()
        }
    }
}
