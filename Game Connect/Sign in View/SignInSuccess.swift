//
//  SignInSuccess.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

class SignInSuccess: UIViewController {
    
    private var successImage: UIImageView!
    private var successLabel: UILabel!
    private var successDescriptionLabel: UILabel!
    private var successButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupLayout()
    }
    
    func setupUI() {
        successImage = UIComponentsFactory.createImageView(
            imageName: "successfulLogin",
            cornerRadius: .zero,
            contentMode: .center
        )
        
        successLabel = UIComponentsFactory.createLabel(
            text: "Yey! Login Successfull",
            font: .boldSystemFont(ofSize: 24),
            textColor: .black,
            alignment: .center
        )
        
        successDescriptionLabel = UIComponentsFactory.createLabel(
            text: "You will be moved to home screen right now.\n Enjoy the features!",
            font: .systemFont(ofSize: 14),
            textColor: .darkGray,
            alignment: .center
        )
        
        successButton = UIComponentsFactory.createButton(
            title: "Let's Explore",
            backgroundColor: UIColor(red: 215/255, green: 4/255, blue: 4/255, alpha: 1),
            actionTarget: self,
            action: #selector(homeScreen)
        )
        
        [successImage, successLabel, successDescriptionLabel, successButton].forEach { view.addSubview($0) }
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            
            successImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            successImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            successLabel.topAnchor.constraint(equalTo: successImage.bottomAnchor, constant: 40),
            successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            successDescriptionLabel.topAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 20),
            successDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            successButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            successButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            successButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            successButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func homeScreen() {
        let homeScreen = HomeScreenViewController()
        let navigationController = UINavigationController(rootViewController: homeScreen)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
