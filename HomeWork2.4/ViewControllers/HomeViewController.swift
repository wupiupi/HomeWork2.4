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
    
    // MARK: - Public Properties
    var user: User!
    
    //MARK: - Private Properties
    private let greetings = ["Hello", "Hi", "Hello there", "sup"]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingLabel.text =
            """
            \(greetings.randomElement() ?? ""), \(user.name)!
            My name is \(user.person.name)!
            """
        setGradientView()
    }
}
