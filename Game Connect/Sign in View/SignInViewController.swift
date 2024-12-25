//
//  SignInViewController.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - UI Elements
    private var titleHeader: UILabel!
    private var subtitleHeader: UILabel!
    private var logo: UIImageView!
    private var logoLabel: UILabel!
    private var email: UITextField!
    private var password: UITextField!
    private var loginButton: UIButton!
    private var signUpLabel: UILabel!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        setupUI()
        setupConstraints()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .white
        
        titleHeader = UIComponentsFactory.createLabel(
            text: "Welcome back!",
            font: .boldSystemFont(ofSize: 24),
            textColor: .black,
            alignment: .center
        )
        
        subtitleHeader = UIComponentsFactory.createLabel(
            text: "Let's login to explore further.",
            font: .systemFont(ofSize: 16),
            textColor: .darkGray,
            alignment: .center
        )
                        
        logo = UIComponentsFactory.createImageView(
            imageName: "signInLogo",
            cornerRadius: .zero,
            contentMode: .scaleAspectFit
        )
        
        logoLabel = UIComponentsFactory.createLabel(
            text: "EXODUS GAMING",
            font: .boldSystemFont(ofSize: 30),
            textColor: .darkGray,
            alignment: .center
        )
        
        email = UIComponentsFactory.createTextField(
            placeholder: "Enter your email",
            backgroundColor: UIColor(red: 248/255, green: 247/255, blue: 251/255, alpha: 1),
            cornerRadius: 7.5,
            iconName: "email"
        )
        
        password = UIComponentsFactory.createTextField(
            placeholder: "Enter your password",
            backgroundColor: UIColor(red: 248/255, green: 247/255, blue: 251/255, alpha: 1),
            cornerRadius: 7.5,
            iconName: "locked"
        )
        
        
        loginButton = UIComponentsFactory.createButton(
            title: "Sign in",
            backgroundColor: UIColor(red: 215/255, green: 4/255, blue: 4/255, alpha: 1),
            actionTarget: self,
            action: #selector(signInTapped)
        )
        
        signUpLabel = UIComponentsFactory.createAttributedLabel(
            text: "Don't have an account? Sign up here!",
            font: .monospacedDigitSystemFont(ofSize: 16, weight: .regular),
            textColor: UIColor(red: 215/255, green: 4/255, blue: 4/255, alpha: 1),
            alignment: .center,
            actionTarget: self,
            action: #selector(signUpPage)
        )
        
        [titleHeader, subtitleHeader, logo, logoLabel, email, password, loginButton, signUpLabel].forEach { view.addSubview($0) }
    }


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

            email.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 40),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            email.heightAnchor.constraint(equalToConstant: 50),

            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            password.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35)
        ])
    }

    // MARK: - Actions
    @objc private func signInTapped() {
//        guard let enteredEmail = email.text, !enteredEmail.isEmpty,
//              let enteredPassword = password.text, !enteredPassword.isEmpty else {
//
//            let alert = UIAlertController(
//                title: "Login Failed",
//                message: "Please enter email and password!",
//                preferredStyle: .alert
//            )
//            alert.addAction(
//                UIAlertAction(
//                    title: "OK",
//                    style: .default,
//                    handler: nil
//                )
//            )
//            present(alert, animated: true, completion: nil)
//            return
//        }

        
        // Retrieve stored credentials
//        let savedEmail = UserDefaults.standard.string(forKey: "userEmail")
//        let savedPassword = UserDefaults.standard.string(forKey: "userPassword")
        
        // Validate credentials
//        if savedEmail == enteredEmail && savedPassword == enteredPassword {
            print("login button tapped!")
            let successfullVC = SignInSuccess()
            navigationController?.pushViewController(successfullVC, animated: true)
//        } else {
//            print("Invalid email or password.")
            // Optionally, show an alert to the user
//            let alert = UIAlertController(
//                title: "Login Failed",
//                message: "Invalid email or password. Please try again.",
//                preferredStyle: .alert
//            )
//            alert.addAction(
//                UIAlertAction(
//                    title: "OK",
//                    style: .default,
//                    handler: nil
//                )
//            )
//            present(alert, animated: true, completion: nil)
//        }
    }

    @objc private func signUpPage() {
        print("sign up text tapped!")
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}
