//
//  SettingsViewController.swift
//  TestPracticeApp
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let sections = ["Account", "Notifications", "Appearance", "Privacy", "Help"]
    private let settings = [
        ["Personal Information", "Subscription", "Language"],
        ["Push Notifications", "Email Notifications", "In-App Notifications"],
        ["Theme", "Text Size", "Display Mode"],
        ["Privacy Policy", "Terms of Service", "Data Usage"],
        ["FAQ", "Contact Support", "About"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Settings"
        
        // Table View
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "settings_table_view"
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        cell.textLabel?.text = settings[indexPath.section][indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.accessibilityIdentifier = "setting_cell_\(indexPath.section)_\(indexPath.row)"
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let settingDetailVC = SettingDetailViewController()
        settingDetailVC.settingName = settings[indexPath.section][indexPath.row]
        navigationController?.pushViewController(settingDetailVC, animated: true)
    }
}
