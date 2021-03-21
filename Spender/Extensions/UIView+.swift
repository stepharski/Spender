//
//  UIView+.swift
//  Spender
//
//  Created by Steve Harski on 3/21/21.
//

import UIKit

extension UIView {
    func addShadow() {
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0,
                                                   width: frame.width,
                                                   height: frame.height))
        layer.cornerRadius = 2
        layer.shadowColor = #colorLiteral(red: 0.2226503789, green: 0.2219562531, blue: 0.2330701947, alpha: 1).cgColor
        layer.shadowOffset = CGSize(width: 0.5, height: 2)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 5
        layer.masksToBounds = false
        layer.shadowPath = shadowPath.cgPath
    }
    
    func addGradient(from color1: UIColor, to color2: UIColor, direction: GradientDirection) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        
        var startPoint = CGPoint.zero
        var endPoint = CGPoint.zero
        
        switch direction {
        case.leftToRight:
            startPoint = CGPoint(x: 0, y: 1)
            endPoint = CGPoint(x: 1, y: 1)
        case .rightToLeft:
            startPoint = CGPoint(x: 1, y: 1)
            endPoint = CGPoint(x: 0, y: 1)
        case .topLeftToBottomRight:
            endPoint = CGPoint(x: 1, y: 1)
        }
        
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        layer.insertSublayer(gradient, at: 0)
    }
}

enum GradientDirection {
    case leftToRight
    case rightToLeft
    case topLeftToBottomRight
}
