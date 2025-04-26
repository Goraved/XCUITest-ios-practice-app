//
//  ProfileViewController.swift
//  TestPracticeApp
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let editButton = UIButton(type: .system)
    private let bioTextView = UITextView()
    private let memberSinceLabel = UILabel()
    private let settingsButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Profile"
        
        // Profile Image View
        profileImageView.backgroundColor = .systemGray4
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.accessibilityIdentifier = "profile_image_view"
        
        // Name Label
        nameLabel.text = "John Doe"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        nameLabel.textAlignment = .center
        nameLabel.accessibilityIdentifier = "profile_name_label"
        
        // Email Label
        emailLabel.text = "john.doe@example.com"
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailLabel.textAlignment = .center
        emailLabel.textColor = .darkGray
        emailLabel.accessibilityIdentifier = "profile_email_label"
        
        // Edit Button
        editButton.setTitle("Edit Profile", for: .normal)
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        editButton.accessibilityIdentifier = "profile_edit_button"
        
        // Bio Text View
        bioTextView.text = "This is a sample bio for testing purposes. You can use this profile screen to practice various test automation scenarios including text fields, buttons, and images."
        bioTextView.font = UIFont.systemFont(ofSize: 16)
        bioTextView.isEditable = false
        bioTextView.backgroundColor = .systemGray6
        bioTextView.layer.cornerRadius = 8
        bioTextView.accessibilityIdentifier = "profile_bio_text_view"
        
        // Member Since Label
        memberSinceLabel.text = "Member since: January 2023"
        memberSinceLabel.font = UIFont.systemFont(ofSize: 14)
        memberSinceLabel.textColor = .darkGray
        memberSinceLabel.textAlignment = .center
        memberSinceLabel.accessibilityIdentifier = "profile_member_since_label"
        
        // Settings Button
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.backgroundColor = .systemBlue
        settingsButton.setTitleColor(.white, for: .normal)
        settingsButton.layer.cornerRadius = 5
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        settingsButton.accessibilityIdentifier = "profile_settings_button"
        
        // Adding views
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(editButton)
        view.addSubview(bioTextView)
        view.addSubview(memberSinceLabel)
        view.addSubview(settingsButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        memberSinceLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            editButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 16),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bioTextView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            bioTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bioTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bioTextView.heightAnchor.constraint(equalToConstant: 120),
            
            memberSinceLabel.topAnchor.constraint(equalTo: bioTextView.bottomAnchor, constant: 20),
            memberSinceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            memberSinceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            memberSinceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            settingsButton.topAnchor.constraint(equalTo: memberSinceLabel.bottomAnchor, constant: 30),
            settingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            settingsButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func editButtonTapped() {
        let alert = UIAlertController(title: "Edit Profile", message: "This feature is not implemented in this test app", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func settingsButtonTapped() {
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}
