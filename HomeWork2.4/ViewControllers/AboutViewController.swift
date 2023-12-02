//
//  AboutViewController.swift
//  HomeWork2.4
//
//  Created by Paul Makey on 1.12.23.
//

import UIKit

final class AboutViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var universityLabel: UILabel!
    @IBOutlet var specializationLabel: UILabel!
    
    // MARK: - Public Properties
    var user: User!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientView()
        setupImageView()
        fillLabels()
        
        title = "\(user.person.name) \(user.person.surname)"
        navigationItem.backButtonTitle = "\(user.person.name) \(user.person.surname)"
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bioVC = segue.destination as? BioViewController else { return }
        bioVC.user = user
    }
    
    // MARK: - Setup UI
    private func setupImageView() {
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
    }
    
    private func fillLabels() {
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        ageLabel.text = user.person.age
        universityLabel.text = user.person.university
        specializationLabel.text = user.person.specialization
    }
}
