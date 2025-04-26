//
//  SettingDetailViewController.swift
//  TestPracticeApp
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit

class SettingDetailViewController: UIViewController {
    
    var settingName: String = ""
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let switch1 = UISwitch()
    private let switch2 = UISwitch()
    private let switch1Label = UILabel()
    private let switch2Label = UILabel()
    private let slider = UISlider()
    private let sliderValueLabel = UILabel()
    private let saveButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = settingName
        
        // Title Label
        titleLabel.text = settingName + " Settings"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        titleLabel.accessibilityIdentifier = "setting_detail_title"
        
        // Description Label
        descriptionLabel.text = "This is a detailed configuration screen for \(settingName). You can use this to practice test automation with various UI elements."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.accessibilityIdentifier = "setting_detail_description"
        
        // Switch 1
        switch1.isOn = true
        switch1.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switch1.accessibilityIdentifier = "setting_switch_1"
        
        // Switch 1 Label
        switch1Label.text = "Enable \(settingName)"
        switch1Label.font = UIFont.systemFont(ofSize: 16)
        switch1Label.accessibilityIdentifier = "setting_switch_1_label"
        
        // Switch 2
        switch2.isOn = false
        switch2.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        switch2.accessibilityIdentifier = "setting_switch_2"
        
        // Switch 2 Label
        switch2Label.text = "Advanced Options"
        switch2Label.font = UIFont.systemFont(ofSize: 16)
        switch2Label.accessibilityIdentifier = "setting_switch_2_label"
        
        // Slider
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        slider.accessibilityIdentifier = "setting_slider"
        
        // Slider Value Label
        sliderValueLabel.text = "Value: 50"
        sliderValueLabel.font = UIFont.systemFont(ofSize: 14)
        sliderValueLabel.textAlignment = .center
        sliderValueLabel.accessibilityIdentifier = "setting_slider_value_label"
        
        // Save Button
        saveButton.setTitle("Save Settings", for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 5
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.accessibilityIdentifier = "setting_save_button"
        
        // Adding views
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(switch1)
        view.addSubview(switch1Label)
        view.addSubview(switch2)
        view.addSubview(switch2Label)
        view.addSubview(slider)
        view.addSubview(sliderValueLabel)
        view.addSubview(saveButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        switch1.translatesAutoresizingMaskIntoConstraints = false
        switch1Label.translatesAutoresizingMaskIntoConstraints = false
        switch2.translatesAutoresizingMaskIntoConstraints = false
        switch2Label.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        sliderValueLabel.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            switch1Label.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            switch1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            switch1.centerYAnchor.constraint(equalTo: switch1Label.centerYAnchor),
            switch1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            switch2Label.topAnchor.constraint(equalTo: switch1Label.bottomAnchor, constant: 20),
            switch2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            switch2.centerYAnchor.constraint(equalTo: switch2Label.centerYAnchor),
            switch2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            slider.topAnchor.constraint(equalTo: switch2Label.bottomAnchor, constant: 30),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            sliderValueLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 8),
            sliderValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            saveButton.topAnchor.constraint(equalTo: sliderValueLabel.bottomAnchor, constant: 40),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        // Handle switch value changes
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        // Update slider value label
        sliderValueLabel.text = "Value: \(Int(sender.value))"
    }
    
    @objc private func saveButtonTapped() {
        // Show saved confirmation
        let alert = UIAlertController(title: "Settings Saved", message: "Your \(settingName) settings have been updated", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true)
    }
}
