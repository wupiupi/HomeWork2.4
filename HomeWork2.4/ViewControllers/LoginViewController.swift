//
//  ViewController.swift
//  HomeWork2.4
//
//  Created by Paul Makey on 27.11.23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 12
    }
    
    // MARK: - IB Action
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        let
    }
}

