//
//  ForgotPasswordViewController.swift
//  TestPracticeApp
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    private let instructionLabel = UILabel()
    private let emailField = UITextField()
    private let submitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Forgot Password"
        
        // Instruction Label
        instructionLabel.text = "Enter your email to reset your password"
        instructionLabel.numberOfLines = 0
        instructionLabel.textAlignment = .center
        instructionLabel.accessibilityIdentifier = "forgot_instruction_label"
        
        // Email Field
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.keyboardType = .emailAddress
        emailField.accessibilityIdentifier = "forgot_email_field"
        
        // Submit Button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 5
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        submitButton.accessibilityIdentifier = "forgot_submit_button"
        
        // Adding views
        view.addSubview(instructionLabel)
        view.addSubview(emailField)
        view.addSubview(submitButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 30),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailField.heightAnchor.constraint(equalToConstant: 44),
            
            submitButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func submitButtonTapped() {
        // Show confirmation
        let alert = UIAlertController(title: "Success", message: "If your email is registered with us, you will receive a password reset link", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true)
    }
}
