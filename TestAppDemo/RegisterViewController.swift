//
//  RegisterViewController.swift
//  TestPracticeApp
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let nameField = UITextField()
    private let emailField = UITextField()
    private let passwordField = UITextField()
    private let confirmPasswordField = UITextField()
    private let registerButton = UIButton(type: .system)
    private let toggleSwitch = UISwitch()
    private let termsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Register"
        
        // Name Field
        nameField.placeholder = "Full Name"
        nameField.borderStyle = .roundedRect
        nameField.accessibilityIdentifier = "register_name_field"
        
        // Email Field
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.accessibilityIdentifier = "register_email_field"
        
        // Password Field
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.borderStyle = .roundedRect
        passwordField.accessibilityIdentifier = "register_password_field"
        
        // Confirm Password Field
        confirmPasswordField.placeholder = "Confirm Password"
        confirmPasswordField.isSecureTextEntry = true
        confirmPasswordField.borderStyle = .roundedRect
        confirmPasswordField.accessibilityIdentifier = "register_confirm_password_field"
        
        // Terms Switch
        toggleSwitch.isOn = false
        toggleSwitch.accessibilityIdentifier = "terms_switch"
        
        // Terms Label
        termsLabel.text = "I accept the Terms and Conditions"
        termsLabel.font = UIFont.systemFont(ofSize: 14)
        termsLabel.accessibilityIdentifier = "terms_label"
        
        // Register Button
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 5
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.accessibilityIdentifier = "register_submit_button"
        
        // Adding views
        view.addSubview(nameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(confirmPasswordField)
        view.addSubview(toggleSwitch)
        view.addSubview(termsLabel)
        view.addSubview(registerButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordField.translatesAutoresizingMaskIntoConstraints = false
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameField.heightAnchor.constraint(equalToConstant: 44),
            
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordField.heightAnchor.constraint(equalToConstant: 44),
            
            confirmPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            confirmPasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            confirmPasswordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 44),
            
            toggleSwitch.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: 20),
            toggleSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            termsLabel.centerYAnchor.constraint(equalTo: toggleSwitch.centerYAnchor),
            termsLabel.leadingAnchor.constraint(equalTo: toggleSwitch.trailingAnchor, constant: 10),
            
            registerButton.topAnchor.constraint(equalTo: toggleSwitch.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func registerButtonTapped() {
        // Basic validation
        if !toggleSwitch.isOn {
            let alert = UIAlertController(title: "Error", message: "Please accept the Terms and Conditions", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        // Navigate to Home screen
        let homeVC = HomeViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
