//
//  SignUpViewController.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Elements
    private var titleHeader = UILabel()
    private var subtitleHeader = UILabel()
    private var logo = UIImageView()
    private var logoLabel = UILabel()
    private var signUpPanel = UIImageView()
    private var email = UITextField()
    private var continueButton = UIButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    // MARK: - UI Setup
    private func setupUI() {

        titleHeader = UIComponentsFactory.createLabel(
            text: "Create your account",
            font: .boldSystemFont(ofSize: 24),
            textColor: .black,
            alignment: .center
        )

        subtitleHeader = UIComponentsFactory.createLabel(
            text: "Create account for exploring news",
            font: .systemFont(ofSize: 16),
            textColor: .darkGray,
            alignment: .center
        )

        logo = UIComponentsFactory.createImageView(
            imageName: "signInLogo",
            cornerRadius: .zero,
            contentMode: .center
        )
        
        logoLabel = UIComponentsFactory.createLabel(
            text: "Exodus Gaming",
            font: .boldSystemFont(ofSize: 30),
            textColor: .black,
            alignment: .center
        )
        
        signUpPanel = UIComponentsFactory.createImageView(
            imageName: "signUpPanel",
            cornerRadius: .zero,
            contentMode: .center
        )
        
        email = UIComponentsFactory.createTextField(
            placeholder: "Enter your email",
            backgroundColor: UIColor(red: 248/255, green: 247/255, blue: 251/255, alpha: 1),
            cornerRadius: 7.5,
            iconName: "email"
        )
        email.delegate = self
        
        continueButton = UIComponentsFactory.createButton(
            title: "Continue",
            backgroundColor: UIColor(red: 215/255, green: 4/255, blue: 4/255, alpha: 1),
            actionTarget: self,
            action: #selector(createAccount)
        )
        
        [titleHeader, subtitleHeader, logo, logoLabel, signUpPanel, email, continueButton].forEach {view.addSubview($0)}
    }
        
    // MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subtitleHeader.topAnchor.constraint(equalTo: titleHeader.bottomAnchor, constant: 10),
            subtitleHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logo.topAnchor.constraint(equalTo: subtitleHeader.bottomAnchor, constant: 40),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpPanel.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 20),
            signUpPanel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            email.topAnchor.constraint(equalTo: signUpPanel.bottomAnchor, constant: 40),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            email.heightAnchor.constraint(equalToConstant: 50),
                        
            continueButton.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 30),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            continueButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    @objc private func createAccount() {
        guard let emailText = email.text, !emailText.isEmpty else {
            showAlert(message: "Please enter a valid email.")
            return
        }
        
        UserDefaults.standard.set(emailText, forKey: "userEmail")
                
        let signUpDetailsVC = SignUpDetailsViewController()
        navigationController?.pushViewController(signUpDetailsVC, animated: true)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
