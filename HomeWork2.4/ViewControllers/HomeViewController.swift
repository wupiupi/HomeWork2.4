//
//  HomeViewController.swift
//  HomeWork2.4
//
//  Created by Paul Makey on 27.11.23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var greetingLabel: UILabel!
    
    // MARK: - Propertie
    var greeting: String!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingLabel.text = greeting
        setupUI()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
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
