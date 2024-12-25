//
//  SignUpViewDetailsController.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

class SignUpDetailsViewController: UIViewController, UITextFieldDelegate {
        
    // MARK: - UI Elements
    private let titleHeader = UILabel()
    private let subtitleHeader = UILabel()
    private let logo = UIImageView()
    private let logoLabel = UILabel()
    private let firstName = UITextField()
    private let lastName = UITextField()
    private let password = UITextField()
    private let confirmPassword = UITextField()
    private let continueButton = UIButton()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    // MARK: - UI Setup
    private func setupView() {
        view.backgroundColor = .white
        configureUIElements()
        
        firstName.delegate = self
        lastName.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
        [titleHeader, subtitleHeader, logo, logoLabel, firstName, lastName, password, confirmPassword, continueButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func configureUIElements() {
        // Title Header
        setupLabel(titleHeader, text: "Create your account", font: .boldSystemFont(ofSize: 24), color: .black, alignment: .center)
        
        // Subtitle Header
        setupLabel(subtitleHeader, text: "Create account for exploring news", font: .systemFont(ofSize: 16), color: .darkGray, alignment: .center)
        
        // Logo
        logo.image = UIImage(named: "signInLogo")
        logo.layer.cornerRadius = 20
        logo.contentMode = .center
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        // Logo Label
        setupLabel(logoLabel, text: "Exodus Gaming", font: .boldSystemFont(ofSize: 30), color: .black)
        
        setupTextField(
            firstName,
            placeholder: "First name",
            backgroundColor: UIColor(red: 248/255, green: 247/255, blue: 251/255, alpha: 1),
            cornerRadius: 7.5,
            iconName: "idCard"
        )
        setupTextField(
            lastName,
            placeholder: "Last name",
            backgroundColor: UIColor(red: 248/255, green: 247/255, blue: 251/255, alpha: 1),
            cornerRadius: 7.5,
            iconName: "idCard"
        )
        setupTextField(
            password,
            placeholder: "Enter your password",
            backgroundColor: UIColor(red: 248/255, green: 247/255, blue: 251/255, alpha: 1),
            cornerRadius: 7.5,
            iconName: "locked"
        )
        setupTextField(
            confirmPassword,
            placeholder: "Confirm password",
            backgroundColor: UIColor(red: 248/255, green: 247/255, blue: 251/255, alpha: 1),
            cornerRadius: 7.5,
            iconName: "locked"
        )

        password.isSecureTextEntry = true
        confirmPassword.isSecureTextEntry = true
        
        // Continue Button
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        continueButton.backgroundColor = UIColor(red: 215/255, green: 4/255, blue: 4/255, alpha: 1)
        continueButton.layer.cornerRadius = 7.5
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(confirmEmail), for: .touchUpInside)
    }
    
    private func setupLabel(_ label: UILabel, text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment = .left) {
        label.text = text
        label.font = font
        label.textColor = color
        label.textAlignment = alignment
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTextField(_ textField: UITextField, placeholder: String, backgroundColor: UIColor, cornerRadius: CGFloat, iconName: String) {
        textField.backgroundColor = backgroundColor
        textField.layer.cornerRadius = cornerRadius
        textField.placeholder = placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false

        // Creates the icon view
        let iconView = UIImageView(image: UIImage(named: iconName))
        iconView.contentMode = .scaleAspectFit
        iconView.frame = CGRect(x: 5, y: 5, width: 20, height: 20) // Adjust icon size and position

        // Creates a container view for padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30)) // Width includes padding
        paddingView.addSubview(iconView)

        // Centers the icon vertically within the padding view
        iconView.center = paddingView.center

        // Assigns the padding view to the left view of the text field
        textField.leftView = paddingView
        textField.leftViewMode = .always
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
            
            firstName.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 40),
            firstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            firstName.heightAnchor.constraint(equalToConstant: 50),
            
            lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 30),
            lastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            lastName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            lastName.heightAnchor.constraint(equalToConstant: 50),

            password.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 30),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            password.heightAnchor.constraint(equalToConstant: 50),

            confirmPassword.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30),
            confirmPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            confirmPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            confirmPassword.heightAnchor.constraint(equalToConstant: 50),

                        
            continueButton.topAnchor.constraint(equalTo: confirmPassword.bottomAnchor, constant: 30),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            continueButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    @objc func confirmEmail() {
//        guard let firstNameText = firstName.text, !firstNameText.isEmpty,
//              let lastNameText = lastName.text, !lastNameText.isEmpty,
//              let passwordText = password.text, !passwordText.isEmpty,
//              let confirmPasswordText = confirmPassword.text, !confirmPasswordText.isEmpty else {
//            print("Please fill in all fields.")
//            return
//        }
//
//        if passwordText != confirmPasswordText {
//            print("Passwords do not match.")
//            return
//        }
        
        // Save user details
//        UserDefaults.standard.set(firstNameText, forKey: "userFirstName")
//        UserDefaults.standard.set(lastNameText, forKey: "userLastName")
//        UserDefaults.standard.set(passwordText, forKey: "userPassword")


        let signUPOTPVC = SignUpOTPViewController()
        navigationController?.pushViewController(signUPOTPVC, animated: true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
