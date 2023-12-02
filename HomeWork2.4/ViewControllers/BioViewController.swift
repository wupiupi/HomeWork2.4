//
//  BioViewController.swift
//  HomeWork2.4
//
//  Created by Paul Makey on 2.12.23.
//

import UIKit

final class BioViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var bioLabel: UILabel!
    
    // MARK: - Properties
    var user: User!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientView()
        
        bioLabel.text = user.person.bio
        title = "\(user.person.name) \(user.person.surname) bio"
    }
}
