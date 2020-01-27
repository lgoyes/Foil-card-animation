//
//  UIImage+Circle.swift
//  Foil-card-animation
//
//  Created by Luis David Goyes Garces on 1/26/20.
//  Copyright © 2020 Luis David Goyes Garces. All rights reserved.
//

import UIKit

extension UIImage {
    class func circle(diameter: CGFloat, color: UIColor) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: diameter, height: diameter))
        let image = renderer.image { (context) in
            context.cgContext.setStrokeColor(color.cgColor)
            context.cgContext.setLineWidth(1)
            context.cgContext.addArc(center: CGPoint(x: diameter/2, y: diameter/2), radius: diameter/2, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            context.cgContext.drawPath(using: .stroke)
        }
        return image
    }
}
