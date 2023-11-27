//
//  ViewController.swift
//  HomeWork2.4
//
//  Created by Paul Makey on 27.11.23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private let greetings = ["Hello", "Hi", "Hello there", "sup"]
    
    // MARK: - IB Outlets
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 12
    }
    
    // MARK: - Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if !isDataValid(
            for: usernameTextField.text ?? "",
            and: passwordTextField.text ?? ""
        ) {
            showAlert(
                title: "Invalid login or password!",
                message: "Please, enter valid data."
            )
            return
        }
        
        let homeVC = segue.destination as? HomeViewController
        homeVC?.greeting = "\(greetings.randomElement() ?? ""), \(usernameTextField.text ?? "")!"
    }
    
    // MARK: - IB Actions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotButtonDidTapped(_ sender: UIButton) {
        switch sender.tag {
            case 0: showAlert(
                title: "I got you!",
                message: "Your username is 'Paul'"
            )
            default: showAlert(
                title: "I got you!",
                message: "Your password is 'Password'"
            )
        }
    }
    
    
    // MARK: - Private methods
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(title: "Добре",
                          style: .default,
                          handler: {
                              _ in
                              self.passwordTextField.text = nil
                          })
        )
        
        present(alert, animated: true)
        
    }
    
    private func isDataValid(for username: String, and password: String) -> Bool {
        if username == "Paul",
           password == "Password" {
            return true
        }
        return false
    }
}

// MARK: - Hiding a keyboard
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
