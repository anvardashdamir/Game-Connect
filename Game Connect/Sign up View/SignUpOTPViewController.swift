//
//  SignUpOTPViewController.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

class SignUpOTPViewController: UIViewController {
    
    // MARK: - UI Components
    private var otpImage: UIImageView!
    private var confirmLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var otpEnterField: UITextField!
    private var verifyButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    func setupUI() {
        otpImage = UIComponentsFactory.createImageView(
            imageName: "signUpPanelOTP",
            cornerRadius: .zero,
            contentMode: .center
        )
        
        confirmLabel = UIComponentsFactory.createLabel(
            text: "Confirm your email!",
            font: .boldSystemFont(ofSize: 24),
            textColor: .black,
            alignment: .center
        )
        
        descriptionLabel = UIComponentsFactory.createLabel(
            text: "We've sent 5 digit verification code to your email!",
            font: .systemFont(ofSize: 14),
            textColor: .darkGray,
            alignment: .center
        )
        
        otpEnterField = UIComponentsFactory.createTextField(
            placeholder: "Enter verification code",
            backgroundColor: UIColor(red: 248/255, green: 247/255, blue: 251/255, alpha: 1),
            cornerRadius: 7.5,
            iconName: "smsCode"
        )
        
        verifyButton = UIComponentsFactory.createButton(
            title: "Verify and create account",
            backgroundColor: .red,
            actionTarget: self,
            action: #selector(SignInSuccess.homeScreen)
        )
        
        [otpImage, confirmLabel, descriptionLabel, otpEnterField, verifyButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout Setup
    func setupLayout() {
        NSLayoutConstraint.activate([
            
            otpImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            otpImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            confirmLabel.topAnchor.constraint(equalTo: otpImage.bottomAnchor, constant: 40),
            confirmLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: confirmLabel.bottomAnchor, constant: 20),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            otpEnterField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            otpEnterField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            otpEnterField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            otpEnterField.heightAnchor.constraint(equalToConstant: 50),

            verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            verifyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            verifyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            verifyButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
