//
//  HomeViewController.swift
//  TestPracticeApp
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let welcomeLabel = UILabel()
    private let segmentedControl = UISegmentedControl(items: ["Features", "Settings"])
    private let tabBarContainer = UIView()
    private let featuresButton = UIButton(type: .system)
    private let profileButton = UIButton(type: .system)
    private let logoutButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Home"
        
        // Hide back button
        navigationItem.hidesBackButton = true
        
        // Welcome Label
        welcomeLabel.text = "Welcome to Test Automation App"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        welcomeLabel.textAlignment = .center
        welcomeLabel.accessibilityIdentifier = "welcome_label"
        
        // Segmented Control
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        segmentedControl.accessibilityIdentifier = "home_segmented_control"
        
        // Tab Bar Container
        tabBarContainer.backgroundColor = .systemGray6
        tabBarContainer.layer.cornerRadius = 8
        
        // Features Button
        featuresButton.setTitle("Features", for: .normal)
        featuresButton.addTarget(self, action: #selector(featuresButtonTapped), for: .touchUpInside)
        featuresButton.accessibilityIdentifier = "features_button"
        
        // Profile Button
        profileButton.setTitle("Profile", for: .normal)
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        profileButton.accessibilityIdentifier = "profile_button"
        
        // Logout Button
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.systemRed, for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        logoutButton.accessibilityIdentifier = "logout_button"
        
        // Adding views
        view.addSubview(welcomeLabel)
        view.addSubview(segmentedControl)
        view.addSubview(tabBarContainer)
        view.addSubview(featuresButton)
        view.addSubview(profileButton)
        view.addSubview(logoutButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        tabBarContainer.translatesAutoresizingMaskIntoConstraints = false
        featuresButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            segmentedControl.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tabBarContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            tabBarContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tabBarContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tabBarContainer.heightAnchor.constraint(equalToConstant: 60),
            
            featuresButton.leadingAnchor.constraint(equalTo: tabBarContainer.leadingAnchor, constant: 20),
            featuresButton.centerYAnchor.constraint(equalTo: tabBarContainer.centerYAnchor),
            
            profileButton.centerXAnchor.constraint(equalTo: tabBarContainer.centerXAnchor),
            profileButton.centerYAnchor.constraint(equalTo: tabBarContainer.centerYAnchor),
            
            logoutButton.trailingAnchor.constraint(equalTo: tabBarContainer.trailingAnchor, constant: -20),
            logoutButton.centerYAnchor.constraint(equalTo: tabBarContainer.centerYAnchor)
        ])
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // Features
            featuresButtonTapped()
        } else {
            // Settings
            let settingsVC = SettingsViewController()
            navigationController?.pushViewController(settingsVC, animated: true)
        }
    }
    
    @objc private func featuresButtonTapped() {
        let featuresVC = FeaturesViewController()
        navigationController?.pushViewController(featuresVC, animated: true)
    }
    
    @objc private func profileButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc private func logoutButtonTapped() {
        // Go back to login screen
        navigationController?.popToRootViewController(animated: true)
    }
}
