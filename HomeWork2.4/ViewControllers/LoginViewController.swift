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
    
    // MARK: - Private Properties
    private let user = User.getUser()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.text = user.name
        passwordTextField.text = user.password
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard usernameTextField.text == user.name, passwordTextField.text == user.password else {
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
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        
        tabBarVC.viewControllers?.forEach { viewController in
            
            if let homeVC = viewController as? HomeViewController {
                homeVC.user = user
            } else if let navVC = viewController as? UINavigationController {
                guard let aboutVC = navVC.topViewController as? AboutViewController else { return }
                aboutVC.user = user
            }
        }
    }
    
    // MARK: - IB Actions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotButtonDidTapped(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "I got you!", message: "Your username is \(user)")
        : showAlert(title: "I got you!", message: "Your password is \(user.password)")
    }
    
    
    
    // MARK: - Private methods
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(title: "Добре", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

// MARK: - Hiding a keyboard
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
