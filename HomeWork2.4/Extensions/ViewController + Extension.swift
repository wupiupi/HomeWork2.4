//
//  ViewController + Extension.swift
//  HomeWork2.4
//
//  Created by Paul Makey on 2.12.23.
//

import UIKit

extension UIViewController {
    func setGradientView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.systemTeal.cgColor,
            UIColor.systemMint.cgColor
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
