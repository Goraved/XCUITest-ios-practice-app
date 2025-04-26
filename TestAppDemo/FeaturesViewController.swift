//
//  FeaturesViewController.swift
//  TestPracticeApp
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit

class FeaturesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    private let features = [
        "XCUIButton - Buttons",
        "XCUITextField - Text Fields",
        "XCUISecureTextField - Secure Text",
        "XCUITextView - Text Views",
        "XCUISwitch - Switches",
        "XCUISlider - Sliders",
        "XCUIStepper - Steppers",
        "XCUISegmentedControl - Segmented Controls",
        "XCUIPickerWheel - Pickers",
        "XCUIDatePicker - Date Pickers",
        "XCUIPageIndicator - Page Indicators",
        "XCUIScrollView - Scroll Views",
        "XCUITableView - Tables",
        "XCUICollectionView - Collections",
        "XCUIAlert - Alerts & Action Sheets",
        "XCUINavigationBar - Navigation",
        "XCUITabBar - Tab Bars",
        "XCUIToolbar - Toolbars",
        "XCUIStaticText - Labels",
        "XCUIImage - Images",
        "XCUIActivityIndicator - Activity Indicators",
        "XCUIProgressIndicator - Progress Views",
        "XCUIWebView - Web Content",
        "XCUIMap - Maps",
        "XCUIKey - Keyboard"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "XCUITest Elements"
        
        // Table View
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FeatureCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "features_table_view"
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath)
        cell.textLabel?.text = features[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.accessibilityIdentifier = "feature_cell_\(indexPath.row)"
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Extract the element type (before the dash)
        let fullFeatureName = features[indexPath.row]
        let components = fullFeatureName.components(separatedBy: " - ")
        let elementType = components[0]
        let displayName = components[1]
        
        let featureDetailVC = UIElementDetailViewController()
        featureDetailVC.elementType = elementType
        featureDetailVC.displayName = displayName
        navigationController?.pushViewController(featureDetailVC, animated: true)
    }
}
