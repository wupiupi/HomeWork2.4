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
    
    // MARK: - Private Properties
    private let greetings = ["Hello", "Hi", "Hello there", "sup"]
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 12
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard usernameTextField.text == "Paul", passwordTextField.text == "Password" else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter valid data.") {
                    self.passwordTextField.text = nil
                }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let homeVC = segue.destination as? HomeViewController
        homeVC?.greeting = "\(greetings.randomElement() ?? ""), \(usernameTextField.text ?? "")!"
    }
    
    // MARK: - IB Actions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotButtonDidTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "I got you!", message: "Your username is 'Paul'")
        : showAlert(title: "I got you!", message: "Your password is 'Password'")
    }
    
    
    
    // MARK: - Private methods
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

// MARK: - Hiding a keyboard
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
