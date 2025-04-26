//
//  UIElementDetailViewController.swift
//  TestAppDemo
//
//  Created by Roman Pobotin on 26.04.2025.
//

import UIKit
import WebKit

class UIElementDetailViewController: UIViewController {
    
    var elementType: String = ""
    var displayName: String = ""
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupElements()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = displayName
        
        // Setup scroll view
        scrollView.accessibilityIdentifier = "element_detail_scrollview"
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // Height will be set after adding elements
        ])
    }
    
    private func setupElements() {
        // Title label
        let titleLabel = UILabel()
        titleLabel.text = "Test \(displayName) Elements"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        titleLabel.accessibilityIdentifier = "element_title_label"
        
        // Description label
        let descriptionLabel = UILabel()
        descriptionLabel.text = "This screen contains various \(displayName) elements for XCUITest automation practice."
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.accessibilityIdentifier = "element_description_label"
        
        // Add basic elements to contentView
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
        
        // Container for demo elements
        let elementsContainer = UIView()
        elementsContainer.backgroundColor = .systemGray6
        elementsContainer.layer.cornerRadius = 10
        contentView.addSubview(elementsContainer)
        
        elementsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            elementsContainer.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            elementsContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            elementsContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            elementsContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        // Add specific elements based on type
        let padding: CGFloat = 20
        
        switch elementType {
        case "XCUIButton":
            // Add different button types
            let regularButton = UIButton(type: .system)
            regularButton.setTitle("Regular Button", for: .normal)
            regularButton.accessibilityIdentifier = "regular_button"
            
            let customButton = UIButton(type: .system)
            customButton.setTitle("Custom Button", for: .normal)
            customButton.backgroundColor = .systemBlue
            customButton.setTitleColor(.white, for: .normal)
            customButton.layer.cornerRadius = 8
            customButton.accessibilityIdentifier = "custom_button"
            
            let imageButton = UIButton(type: .system)
            imageButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            imageButton.accessibilityIdentifier = "image_button"
            
            elementsContainer.addSubview(regularButton)
            elementsContainer.addSubview(customButton)
            elementsContainer.addSubview(imageButton)
            
            regularButton.translatesAutoresizingMaskIntoConstraints = false
            customButton.translatesAutoresizingMaskIntoConstraints = false
            imageButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularButton.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularButton.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                regularButton.heightAnchor.constraint(equalToConstant: 44),
                regularButton.widthAnchor.constraint(equalToConstant: 200),
                
                customButton.topAnchor.constraint(equalTo: regularButton.bottomAnchor, constant: padding),
                customButton.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                customButton.heightAnchor.constraint(equalToConstant: 44),
                customButton.widthAnchor.constraint(equalToConstant: 200),
                
                imageButton.topAnchor.constraint(equalTo: customButton.bottomAnchor, constant: padding),
                imageButton.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                imageButton.heightAnchor.constraint(equalToConstant: 44),
                imageButton.widthAnchor.constraint(equalToConstant: 44),
                
                elementsContainer.bottomAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: padding)
            ])
            
        case "XCUIStaticText":
            // Labels demo
            let titleLabel = UILabel()
            titleLabel.text = "Title Label"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
            titleLabel.accessibilityIdentifier = "title_label"
            
            let subtitleLabel = UILabel()
            subtitleLabel.text = "Subtitle with smaller font"
            subtitleLabel.font = UIFont.systemFont(ofSize: 17)
            subtitleLabel.textColor = .darkGray
            subtitleLabel.accessibilityIdentifier = "subtitle_label"
            
            let multilineLabel = UILabel()
            multilineLabel.text = "This is a multiline label with a longer text. It demonstrates how text can wrap across multiple lines in a UILabel."
            multilineLabel.numberOfLines = 0
            multilineLabel.accessibilityIdentifier = "multiline_label"
            
            let attributedLabel = UILabel()
            let attributedText = NSMutableAttributedString(string: "Styled text with ")
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.systemBlue,
                .font: UIFont.boldSystemFont(ofSize: 16)
            ]
            attributedText.append(NSAttributedString(string: "different attributes", attributes: attributes))
            attributedLabel.attributedText = attributedText
            attributedLabel.accessibilityIdentifier = "attributed_label"
            
            elementsContainer.addSubview(titleLabel)
            elementsContainer.addSubview(subtitleLabel)
            elementsContainer.addSubview(multilineLabel)
            elementsContainer.addSubview(attributedLabel)
            
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
            multilineLabel.translatesAutoresizingMaskIntoConstraints = false
            attributedLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                titleLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                titleLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                subtitleLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                subtitleLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                multilineLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15),
                multilineLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                multilineLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                attributedLabel.topAnchor.constraint(equalTo: multilineLabel.bottomAnchor, constant: 15),
                attributedLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                attributedLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                elementsContainer.bottomAnchor.constraint(equalTo: attributedLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUIImage":
            // Images demo
            let regularImage = UIImageView(image: UIImage(systemName: "photo"))
            regularImage.contentMode = .scaleAspectFit
            regularImage.backgroundColor = .systemGray6
            regularImage.accessibilityIdentifier = "regular_image"
            
            let circularImage = UIImageView(image: UIImage(systemName: "person.circle.fill"))
            circularImage.contentMode = .scaleAspectFit
            circularImage.tintColor = .systemBlue
            circularImage.accessibilityIdentifier = "circular_image"
            
            let imageLabel = UILabel()
            imageLabel.text = "Images can be tested with XCUITest by verifying their existence and attributes"
            imageLabel.numberOfLines = 0
            imageLabel.textAlignment = .center
            imageLabel.font = UIFont.systemFont(ofSize: 14)
            imageLabel.accessibilityIdentifier = "image_label"
            
            elementsContainer.addSubview(regularImage)
            elementsContainer.addSubview(circularImage)
            elementsContainer.addSubview(imageLabel)
            
            regularImage.translatesAutoresizingMaskIntoConstraints = false
            circularImage.translatesAutoresizingMaskIntoConstraints = false
            imageLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularImage.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularImage.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor, constant: -60),
                regularImage.widthAnchor.constraint(equalToConstant: 100),
                regularImage.heightAnchor.constraint(equalToConstant: 100),
                
                circularImage.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                circularImage.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor, constant: 60),
                circularImage.widthAnchor.constraint(equalToConstant: 100),
                circularImage.heightAnchor.constraint(equalToConstant: 100),
                
                imageLabel.topAnchor.constraint(equalTo: regularImage.bottomAnchor, constant: padding),
                imageLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                imageLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                elementsContainer.bottomAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUIActivityIndicator":
            // Activity indicators demo
            let regularActivityIndicator = UIActivityIndicatorView(style: .medium)
            regularActivityIndicator.startAnimating()
            regularActivityIndicator.accessibilityIdentifier = "regular_activity_indicator"
            
            let largeActivityIndicator = UIActivityIndicatorView(style: .large)
            largeActivityIndicator.startAnimating()
            largeActivityIndicator.color = .systemBlue
            largeActivityIndicator.accessibilityIdentifier = "large_activity_indicator"
            
            let activityLabel = UILabel()
            activityLabel.text = "Activity indicators show that a task is in progress. You can test if they are animating."
            activityLabel.numberOfLines = 0
            activityLabel.textAlignment = .center
            activityLabel.font = UIFont.systemFont(ofSize: 14)
            activityLabel.accessibilityIdentifier = "activity_label"
            
            elementsContainer.addSubview(regularActivityIndicator)
            elementsContainer.addSubview(largeActivityIndicator)
            elementsContainer.addSubview(activityLabel)
            
            regularActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
            largeActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularActivityIndicator.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularActivityIndicator.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor, constant: -60),
                
                largeActivityIndicator.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                largeActivityIndicator.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor, constant: 60),
                
                activityLabel.topAnchor.constraint(equalTo: largeActivityIndicator.bottomAnchor, constant: padding),
                activityLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                activityLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                elementsContainer.bottomAnchor.constraint(equalTo: activityLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUIProgressIndicator":
            // Progress indicators demo
            let progressView = UIProgressView(progressViewStyle: .default)
            progressView.progress = 0.7
            progressView.accessibilityIdentifier = "progress_view"
            
            let tintedProgressView = UIProgressView(progressViewStyle: .default)
            tintedProgressView.progress = 0.4
            tintedProgressView.progressTintColor = .systemGreen
            tintedProgressView.trackTintColor = .systemGray5
            tintedProgressView.accessibilityIdentifier = "tinted_progress_view"
            
            let progressLabel = UILabel()
            progressLabel.text = "Progress indicators show the progress of a task. The top one is at 70%, the bottom at 40%."
            progressLabel.numberOfLines = 0
            progressLabel.textAlignment = .center
            progressLabel.font = UIFont.systemFont(ofSize: 14)
            
            
        case "XCUITableView":
            // Add table view
            let demoTableView = UITableView(frame: .zero, style: .plain)
            demoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DemoCell")
            demoTableView.accessibilityIdentifier = "demo_table_view"
            
            // Set up a simple data source - normally we'd use a delegate & data source
            let tableData = ["Row 1", "Row 2", "Row 3", "Row 4", "Row 5"]
            
            // Configure the table view with cells (simplified)
            for i in 0..<tableData.count {
                let cell = UITableViewCell(style: .default, reuseIdentifier: "DemoCell")
                cell.textLabel?.text = tableData[i]
                cell.accessibilityIdentifier = "table_cell_\(i)"
                // In a real app, we'd use proper delegate/datasource methods
            }
            
            elementsContainer.addSubview(demoTableView)
            demoTableView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                demoTableView.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                demoTableView.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                demoTableView.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                demoTableView.heightAnchor.constraint(equalToConstant: 200),
                
                elementsContainer.bottomAnchor.constraint(equalTo: demoTableView.bottomAnchor, constant: padding)
            ])
            
        case "XCUICollectionView":
            // Add collection view
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 80, height: 80)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            
            let demoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            demoCollectionView.backgroundColor = .white
            demoCollectionView.accessibilityIdentifier = "demo_collection_view"
            
            // Register cell class - in a real app, we'd implement proper delegate methods
            demoCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
            
            elementsContainer.addSubview(demoCollectionView)
            demoCollectionView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                demoCollectionView.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                demoCollectionView.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                demoCollectionView.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                demoCollectionView.heightAnchor.constraint(equalToConstant: 200),
                
                elementsContainer.bottomAnchor.constraint(equalTo: demoCollectionView.bottomAnchor, constant: padding)
            ])
            
        case "XCUIAlert":
            // Demo for alerts (can't show actual alert in this view)
            let alertButton = UIButton(type: .system)
            alertButton.setTitle("Show Alert", for: .normal)
            alertButton.backgroundColor = .systemBlue
            alertButton.setTitleColor(.white, for: .normal)
            alertButton.layer.cornerRadius = 8
            alertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
            alertButton.accessibilityIdentifier = "show_alert_button"
            
            let actionSheetButton = UIButton(type: .system)
            actionSheetButton.setTitle("Show Action Sheet", for: .normal)
            actionSheetButton.backgroundColor = .systemGreen
            actionSheetButton.setTitleColor(.white, for: .normal)
            actionSheetButton.layer.cornerRadius = 8
            actionSheetButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
            actionSheetButton.accessibilityIdentifier = "show_action_sheet_button"
            
            let alertDescriptionLabel = UILabel()
            alertDescriptionLabel.text = "Tap the buttons above to show different types of alerts and action sheets."
            alertDescriptionLabel.numberOfLines = 0
            alertDescriptionLabel.textAlignment = .center
            alertDescriptionLabel.font = UIFont.systemFont(ofSize: 14)
            alertDescriptionLabel.accessibilityIdentifier = "alert_description_label"
            
            elementsContainer.addSubview(alertButton)
            elementsContainer.addSubview(actionSheetButton)
            elementsContainer.addSubview(alertDescriptionLabel)
            
            alertButton.translatesAutoresizingMaskIntoConstraints = false
            actionSheetButton.translatesAutoresizingMaskIntoConstraints = false
            alertDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                alertButton.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                alertButton.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                alertButton.widthAnchor.constraint(equalToConstant: 200),
                alertButton.heightAnchor.constraint(equalToConstant: 44),
                
                actionSheetButton.topAnchor.constraint(equalTo: alertButton.bottomAnchor, constant: padding),
                actionSheetButton.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                actionSheetButton.widthAnchor.constraint(equalToConstant: 200),
                actionSheetButton.heightAnchor.constraint(equalToConstant: 44),
                
                alertDescriptionLabel.topAnchor.constraint(equalTo: actionSheetButton.bottomAnchor, constant: padding),
                alertDescriptionLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                alertDescriptionLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                elementsContainer.bottomAnchor.constraint(equalTo: alertDescriptionLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUINavigationBar":
            // Navigation bar demo
            let navBarDemo = UIView()
            navBarDemo.backgroundColor = .systemBlue
            navBarDemo.layer.cornerRadius = 8
            
            let navTitleLabel = UILabel()
            navTitleLabel.text = "Navigation Bar Title"
            navTitleLabel.textColor = .white
            navTitleLabel.font = UIFont.boldSystemFont(ofSize: 17)
            navTitleLabel.accessibilityIdentifier = "nav_title_label"
            
            let backButton = UIButton(type: .system)
            backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            backButton.tintColor = .white
            backButton.accessibilityIdentifier = "back_button"
            
            let rightButton = UIButton(type: .system)
            rightButton.setTitle("Edit", for: .normal)
            rightButton.tintColor = .white
            rightButton.accessibilityIdentifier = "edit_button"
            
            let descriptionLabel = UILabel()
            descriptionLabel.text = "This is a simulated navigation bar. The real navigation bar is at the top of this screen."
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .center
            descriptionLabel.font = UIFont.systemFont(ofSize: 14)
            descriptionLabel.accessibilityIdentifier = "nav_description_label"
            
            navBarDemo.addSubview(navTitleLabel)
            navBarDemo.addSubview(backButton)
            navBarDemo.addSubview(rightButton)
            elementsContainer.addSubview(navBarDemo)
            elementsContainer.addSubview(descriptionLabel)
            
            navBarDemo.translatesAutoresizingMaskIntoConstraints = false
            navTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            backButton.translatesAutoresizingMaskIntoConstraints = false
            rightButton.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                navBarDemo.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                navBarDemo.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                navBarDemo.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                navBarDemo.heightAnchor.constraint(equalToConstant: 44),
                
                backButton.leadingAnchor.constraint(equalTo: navBarDemo.leadingAnchor, constant: 16),
                backButton.centerYAnchor.constraint(equalTo: navBarDemo.centerYAnchor),
                
                navTitleLabel.centerXAnchor.constraint(equalTo: navBarDemo.centerXAnchor),
                navTitleLabel.centerYAnchor.constraint(equalTo: navBarDemo.centerYAnchor),
                
                rightButton.trailingAnchor.constraint(equalTo: navBarDemo.trailingAnchor, constant: -16),
                rightButton.centerYAnchor.constraint(equalTo: navBarDemo.centerYAnchor),
                
                descriptionLabel.topAnchor.constraint(equalTo: navBarDemo.bottomAnchor, constant: padding),
                descriptionLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                descriptionLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                elementsContainer.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUITabBar":
            // Tab bar demo
            let tabBarDemo = UIView()
            tabBarDemo.backgroundColor = .systemBackground
            tabBarDemo.layer.borderWidth = 1
            tabBarDemo.layer.borderColor = UIColor.systemGray3.cgColor
            tabBarDemo.accessibilityIdentifier = "tab_bar_demo"
            
            // Create tab items
            let homeTab = createTabItem(imageName: "house.fill", title: "Home")
            let searchTab = createTabItem(imageName: "magnifyingglass", title: "Search")
            let profileTab = createTabItem(imageName: "person.fill", title: "Profile")
            let settingsTab = createTabItem(imageName: "gear", title: "Settings")
            
            tabBarDemo.addSubview(homeTab)
            tabBarDemo.addSubview(searchTab)
            tabBarDemo.addSubview(profileTab)
            tabBarDemo.addSubview(settingsTab)
            
            let descriptionLabel = UILabel()
            descriptionLabel.text = "This is a simulated tab bar. You can tap on the different tabs."
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .center
            descriptionLabel.font = UIFont.systemFont(ofSize: 14)
            descriptionLabel.accessibilityIdentifier = "tab_bar_description_label"
            
            elementsContainer.addSubview(tabBarDemo)
            elementsContainer.addSubview(descriptionLabel)
            
            tabBarDemo.translatesAutoresizingMaskIntoConstraints = false
            homeTab.translatesAutoresizingMaskIntoConstraints = false
            searchTab.translatesAutoresizingMaskIntoConstraints = false
            profileTab.translatesAutoresizingMaskIntoConstraints = false
            settingsTab.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                tabBarDemo.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                tabBarDemo.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                tabBarDemo.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                tabBarDemo.heightAnchor.constraint(equalToConstant: 50),
                
                homeTab.leadingAnchor.constraint(equalTo: tabBarDemo.leadingAnchor),
                homeTab.topAnchor.constraint(equalTo: tabBarDemo.topAnchor),
                homeTab.bottomAnchor.constraint(equalTo: tabBarDemo.bottomAnchor),
                homeTab.widthAnchor.constraint(equalTo: tabBarDemo.widthAnchor, multiplier: 0.25),
                
                searchTab.leadingAnchor.constraint(equalTo: homeTab.trailingAnchor),
                searchTab.topAnchor.constraint(equalTo: tabBarDemo.topAnchor),
                searchTab.bottomAnchor.constraint(equalTo: tabBarDemo.bottomAnchor),
                searchTab.widthAnchor.constraint(equalTo: tabBarDemo.widthAnchor, multiplier: 0.25),
                
                profileTab.leadingAnchor.constraint(equalTo: searchTab.trailingAnchor),
                profileTab.topAnchor.constraint(equalTo: tabBarDemo.topAnchor),
                profileTab.bottomAnchor.constraint(equalTo: tabBarDemo.bottomAnchor),
                profileTab.widthAnchor.constraint(equalTo: tabBarDemo.widthAnchor, multiplier: 0.25),
                
                settingsTab.leadingAnchor.constraint(equalTo: profileTab.trailingAnchor),
                settingsTab.topAnchor.constraint(equalTo: tabBarDemo.topAnchor),
                settingsTab.bottomAnchor.constraint(equalTo: tabBarDemo.bottomAnchor),
                settingsTab.widthAnchor.constraint(equalTo: tabBarDemo.widthAnchor, multiplier: 0.25),
                
                descriptionLabel.topAnchor.constraint(equalTo: tabBarDemo.bottomAnchor, constant: padding),
                descriptionLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                descriptionLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                elementsContainer.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUIToolbar":
            // Toolbar demo
            let toolbarDemo = UIView()
            toolbarDemo.backgroundColor = .systemGray6
            toolbarDemo.layer.cornerRadius = 4
            toolbarDemo.accessibilityIdentifier = "toolbar_demo"
            
            // Create toolbar items
            let backButton = UIButton(type: .system)
            backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            backButton.accessibilityIdentifier = "toolbar_back_button"
            
            let forwardButton = UIButton(type: .system)
            forwardButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
            forwardButton.accessibilityIdentifier = "toolbar_forward_button"
            
            let shareButton = UIButton(type: .system)
            shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
            shareButton.accessibilityIdentifier = "toolbar_share_button"
            
            let bookmarkButton = UIButton(type: .system)
            bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
            bookmarkButton.accessibilityIdentifier = "toolbar_bookmark_button"
            
            toolbarDemo.addSubview(backButton)
            toolbarDemo.addSubview(forwardButton)
            toolbarDemo.addSubview(shareButton)
            toolbarDemo.addSubview(bookmarkButton)
            
            let descriptionLabel = UILabel()
            descriptionLabel.text = "This is a simulated toolbar. You can tap on the different toolbar items."
            descriptionLabel.numberOfLines = 0
            descriptionLabel.textAlignment = .center
            descriptionLabel.font = UIFont.systemFont(ofSize: 14)
            descriptionLabel.accessibilityIdentifier = "toolbar_description_label"
            
            elementsContainer.addSubview(toolbarDemo)
            elementsContainer.addSubview(descriptionLabel)
            
            toolbarDemo.translatesAutoresizingMaskIntoConstraints = false
            backButton.translatesAutoresizingMaskIntoConstraints = false
            forwardButton.translatesAutoresizingMaskIntoConstraints = false
            shareButton.translatesAutoresizingMaskIntoConstraints = false
            bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                toolbarDemo.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                toolbarDemo.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                toolbarDemo.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                toolbarDemo.heightAnchor.constraint(equalToConstant: 44),
                
                backButton.leadingAnchor.constraint(equalTo: toolbarDemo.leadingAnchor, constant: 20),
                backButton.centerYAnchor.constraint(equalTo: toolbarDemo.centerYAnchor),
                
                forwardButton.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 20),
                forwardButton.centerYAnchor.constraint(equalTo: toolbarDemo.centerYAnchor),
                
                bookmarkButton.trailingAnchor.constraint(equalTo: toolbarDemo.trailingAnchor, constant: -20),
                bookmarkButton.centerYAnchor.constraint(equalTo: toolbarDemo.centerYAnchor),
                
                shareButton.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -20),
                shareButton.centerYAnchor.constraint(equalTo: toolbarDemo.centerYAnchor),
                
                descriptionLabel.topAnchor.constraint(equalTo: toolbarDemo.bottomAnchor, constant: padding),
                descriptionLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                descriptionLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                elementsContainer.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUITextField":
            // Add text fields
            let regularTextField = UITextField()
            regularTextField.placeholder = "Regular Text Field"
            regularTextField.borderStyle = .roundedRect
            regularTextField.accessibilityIdentifier = "regular_text_field"
            
            let emailTextField = UITextField()
            emailTextField.placeholder = "Email Text Field"
            emailTextField.borderStyle = .roundedRect
            emailTextField.keyboardType = .emailAddress
            emailTextField.accessibilityIdentifier = "email_text_field"
            
            let numericTextField = UITextField()
            numericTextField.placeholder = "Numeric Text Field"
            numericTextField.borderStyle = .roundedRect
            numericTextField.keyboardType = .numberPad
            numericTextField.accessibilityIdentifier = "numeric_text_field"
            
            elementsContainer.addSubview(regularTextField)
            elementsContainer.addSubview(emailTextField)
            elementsContainer.addSubview(numericTextField)
            
            regularTextField.translatesAutoresizingMaskIntoConstraints = false
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            numericTextField.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularTextField.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularTextField.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                regularTextField.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                regularTextField.heightAnchor.constraint(equalToConstant: 44),
                
                emailTextField.topAnchor.constraint(equalTo: regularTextField.bottomAnchor, constant: padding),
                emailTextField.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                emailTextField.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                emailTextField.heightAnchor.constraint(equalToConstant: 44),
                
                numericTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: padding),
                numericTextField.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                numericTextField.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                numericTextField.heightAnchor.constraint(equalToConstant: 44),
                
                elementsContainer.bottomAnchor.constraint(equalTo: numericTextField.bottomAnchor, constant: padding)
            ])
            
        case "XCUISecureTextField":
            // Add secure text fields
            let passwordField = UITextField()
            passwordField.placeholder = "Password Field"
            passwordField.borderStyle = .roundedRect
            passwordField.isSecureTextEntry = true
            passwordField.accessibilityIdentifier = "password_field"
            
            let pinField = UITextField()
            pinField.placeholder = "PIN Field"
            pinField.borderStyle = .roundedRect
            pinField.isSecureTextEntry = true
            pinField.keyboardType = .numberPad
            pinField.accessibilityIdentifier = "pin_field"
            
            elementsContainer.addSubview(passwordField)
            elementsContainer.addSubview(pinField)
            
            passwordField.translatesAutoresizingMaskIntoConstraints = false
            pinField.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                passwordField.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                passwordField.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                passwordField.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                passwordField.heightAnchor.constraint(equalToConstant: 44),
                
                pinField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: padding),
                pinField.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                pinField.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                pinField.heightAnchor.constraint(equalToConstant: 44),
                
                elementsContainer.bottomAnchor.constraint(equalTo: pinField.bottomAnchor, constant: padding)
            ])
            
        case "XCUITextView":
            // Add text views
            let regularTextView = UITextView()
            regularTextView.text = "This is a regular text view that can contain multiple lines of text. You can type longer content here."
            regularTextView.font = UIFont.systemFont(ofSize: 16)
            regularTextView.layer.borderWidth = 1
            regularTextView.layer.borderColor = UIColor.systemGray3.cgColor
            regularTextView.layer.cornerRadius = 8
            regularTextView.accessibilityIdentifier = "regular_text_view"
            
            let readOnlyTextView = UITextView()
            readOnlyTextView.text = "This is a read-only text view. You cannot edit this content."
            readOnlyTextView.font = UIFont.systemFont(ofSize: 16)
            readOnlyTextView.isEditable = false
            readOnlyTextView.backgroundColor = .systemGray5
            readOnlyTextView.layer.cornerRadius = 8
            readOnlyTextView.accessibilityIdentifier = "read_only_text_view"
            
            elementsContainer.addSubview(regularTextView)
            elementsContainer.addSubview(readOnlyTextView)
            
            regularTextView.translatesAutoresizingMaskIntoConstraints = false
            readOnlyTextView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularTextView.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularTextView.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                regularTextView.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                regularTextView.heightAnchor.constraint(equalToConstant: 100),
                
                readOnlyTextView.topAnchor.constraint(equalTo: regularTextView.bottomAnchor, constant: padding),
                readOnlyTextView.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                readOnlyTextView.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                readOnlyTextView.heightAnchor.constraint(equalToConstant: 100),
                
                elementsContainer.bottomAnchor.constraint(equalTo: readOnlyTextView.bottomAnchor, constant: padding)
            ])
            
        case "XCUISwitch":
            // Add switches
            let regularSwitch = UISwitch()
            regularSwitch.isOn = true
            regularSwitch.accessibilityIdentifier = "regular_switch"
            
            let regularSwitchLabel = UILabel()
            regularSwitchLabel.text = "Enable Feature"
            regularSwitchLabel.accessibilityIdentifier = "regular_switch_label"
            
            let customSwitch = UISwitch()
            customSwitch.isOn = false
            customSwitch.onTintColor = .systemGreen
            customSwitch.accessibilityIdentifier = "custom_switch"
            
            let customSwitchLabel = UILabel()
            customSwitchLabel.text = "Custom Switch"
            customSwitchLabel.accessibilityIdentifier = "custom_switch_label"
            
            elementsContainer.addSubview(regularSwitch)
            elementsContainer.addSubview(regularSwitchLabel)
            elementsContainer.addSubview(customSwitch)
            elementsContainer.addSubview(customSwitchLabel)
            
            regularSwitch.translatesAutoresizingMaskIntoConstraints = false
            regularSwitchLabel.translatesAutoresizingMaskIntoConstraints = false
            customSwitch.translatesAutoresizingMaskIntoConstraints = false
            customSwitchLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularSwitchLabel.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularSwitchLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                
                regularSwitch.centerYAnchor.constraint(equalTo: regularSwitchLabel.centerYAnchor),
                regularSwitch.leadingAnchor.constraint(equalTo: regularSwitchLabel.trailingAnchor, constant: 10),
                
                customSwitchLabel.topAnchor.constraint(equalTo: regularSwitchLabel.bottomAnchor, constant: padding),
                customSwitchLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                
                customSwitch.centerYAnchor.constraint(equalTo: customSwitchLabel.centerYAnchor),
                customSwitch.leadingAnchor.constraint(equalTo: customSwitchLabel.trailingAnchor, constant: 10),
                
                elementsContainer.bottomAnchor.constraint(equalTo: customSwitchLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUISlider":
            // Add sliders
            let regularSlider = UISlider()
            regularSlider.minimumValue = 0
            regularSlider.maximumValue = 100
            regularSlider.value = 50
            regularSlider.accessibilityIdentifier = "regular_slider"
            
            let regularSliderLabel = UILabel()
            regularSliderLabel.text = "Volume: 50%"
            regularSliderLabel.accessibilityIdentifier = "regular_slider_label"
            
            let customSlider = UISlider()
            customSlider.minimumValue = 0
            customSlider.maximumValue = 5
            customSlider.value = 3
            customSlider.minimumTrackTintColor = .systemBlue
            customSlider.maximumTrackTintColor = .systemGray
            customSlider.thumbTintColor = .systemOrange
            customSlider.accessibilityIdentifier = "custom_slider"
            
            let customSliderLabel = UILabel()
            customSliderLabel.text = "Rating: 3/5"
            customSliderLabel.accessibilityIdentifier = "custom_slider_label"
            
            elementsContainer.addSubview(regularSlider)
            elementsContainer.addSubview(regularSliderLabel)
            elementsContainer.addSubview(customSlider)
            elementsContainer.addSubview(customSliderLabel)
            
            regularSlider.translatesAutoresizingMaskIntoConstraints = false
            regularSliderLabel.translatesAutoresizingMaskIntoConstraints = false
            customSlider.translatesAutoresizingMaskIntoConstraints = false
            customSliderLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularSliderLabel.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularSliderLabel.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                
                regularSlider.topAnchor.constraint(equalTo: regularSliderLabel.bottomAnchor, constant: 10),
                regularSlider.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                regularSlider.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                customSliderLabel.topAnchor.constraint(equalTo: regularSlider.bottomAnchor, constant: 20),
                customSliderLabel.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                
                customSlider.topAnchor.constraint(equalTo: customSliderLabel.bottomAnchor, constant: 10),
                customSlider.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                customSlider.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                elementsContainer.bottomAnchor.constraint(equalTo: customSlider.bottomAnchor, constant: padding)
            ])
            
        case "XCUIStepper":
            // Add steppers
            let regularStepper = UIStepper()
            regularStepper.minimumValue = 0
            regularStepper.maximumValue = 10
            regularStepper.value = 5
            regularStepper.stepValue = 1
            regularStepper.accessibilityIdentifier = "regular_stepper"
            
            let regularStepperLabel = UILabel()
            regularStepperLabel.text = "Quantity: 5"
            regularStepperLabel.accessibilityIdentifier = "regular_stepper_label"
            
            let customStepper = UIStepper()
            customStepper.minimumValue = 0
            customStepper.maximumValue = 100
            customStepper.value = 25
            customStepper.stepValue = 5
            customStepper.tintColor = .systemBlue
            customStepper.accessibilityIdentifier = "custom_stepper"
            
            let customStepperLabel = UILabel()
            customStepperLabel.text = "Percentage: 25%"
            customStepperLabel.accessibilityIdentifier = "custom_stepper_label"
            
            elementsContainer.addSubview(regularStepper)
            elementsContainer.addSubview(regularStepperLabel)
            elementsContainer.addSubview(customStepper)
            elementsContainer.addSubview(customStepperLabel)
            
            regularStepper.translatesAutoresizingMaskIntoConstraints = false
            regularStepperLabel.translatesAutoresizingMaskIntoConstraints = false
            customStepper.translatesAutoresizingMaskIntoConstraints = false
            customStepperLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularStepperLabel.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularStepperLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                
                regularStepper.centerYAnchor.constraint(equalTo: regularStepperLabel.centerYAnchor),
                regularStepper.leadingAnchor.constraint(equalTo: regularStepperLabel.trailingAnchor, constant: 20),
                
                customStepperLabel.topAnchor.constraint(equalTo: regularStepperLabel.bottomAnchor, constant: 30),
                customStepperLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                
                customStepper.centerYAnchor.constraint(equalTo: customStepperLabel.centerYAnchor),
                customStepper.leadingAnchor.constraint(equalTo: customStepperLabel.trailingAnchor, constant: 20),
                
                elementsContainer.bottomAnchor.constraint(equalTo: customStepperLabel.bottomAnchor, constant: padding)
            ])
            
        case "XCUISegmentedControl":
            // Add segmented controls
            let regularSegmentedControl = UISegmentedControl(items: ["One", "Two", "Three"])
            regularSegmentedControl.selectedSegmentIndex = 0
            regularSegmentedControl.accessibilityIdentifier = "regular_segmented_control"
            
            let customSegmentedControl = UISegmentedControl(items: ["Day", "Week", "Month", "Year"])
            customSegmentedControl.selectedSegmentIndex = 1
            customSegmentedControl.accessibilityIdentifier = "custom_segmented_control"
            
            let imageSegmentedControl = UISegmentedControl()
            imageSegmentedControl.insertSegment(with: UIImage(systemName: "list.bullet"), at: 0, animated: false)
            imageSegmentedControl.insertSegment(with: UIImage(systemName: "square.grid.2x2"), at: 1, animated: false)
            imageSegmentedControl.selectedSegmentIndex = 0
            imageSegmentedControl.accessibilityIdentifier = "image_segmented_control"
            
            elementsContainer.addSubview(regularSegmentedControl)
            elementsContainer.addSubview(customSegmentedControl)
            elementsContainer.addSubview(imageSegmentedControl)
            
            regularSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            customSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            imageSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularSegmentedControl.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularSegmentedControl.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                regularSegmentedControl.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                customSegmentedControl.topAnchor.constraint(equalTo: regularSegmentedControl.bottomAnchor, constant: padding),
                customSegmentedControl.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                customSegmentedControl.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                
                imageSegmentedControl.topAnchor.constraint(equalTo: customSegmentedControl.bottomAnchor, constant: padding),
                imageSegmentedControl.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                imageSegmentedControl.widthAnchor.constraint(equalToConstant: 120),
                
                elementsContainer.bottomAnchor.constraint(equalTo: imageSegmentedControl.bottomAnchor, constant: padding)
            ])
            
        case "XCUIPickerWheel":
            // Add picker view
            let regularPicker = UIPickerView()
            regularPicker.accessibilityIdentifier = "regular_picker"
            
            // We'd normally set the delegate and datasource, but for testing purposes
            // this is sufficient to show the UI element
            
            elementsContainer.addSubview(regularPicker)
            
            regularPicker.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                regularPicker.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                regularPicker.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                regularPicker.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                regularPicker.heightAnchor.constraint(equalToConstant: 200),
                
                elementsContainer.bottomAnchor.constraint(equalTo: regularPicker.bottomAnchor, constant: padding)
            ])
            
        case "XCUIDatePicker":
            // Add date pickers
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = .wheels
            }
            datePicker.accessibilityIdentifier = "date_picker"
            
            let timePicker = UIDatePicker()
            timePicker.datePickerMode = .time
            if #available(iOS 13.4, *) {
                timePicker.preferredDatePickerStyle = .wheels
            }
            timePicker.accessibilityIdentifier = "time_picker"
            
            let dateTimePicker = UIDatePicker()
            dateTimePicker.datePickerMode = .dateAndTime
            if #available(iOS 13.4, *) {
                dateTimePicker.preferredDatePickerStyle = .wheels
            }
            dateTimePicker.accessibilityIdentifier = "date_time_picker"
            
            elementsContainer.addSubview(datePicker)
            elementsContainer.addSubview(timePicker)
            elementsContainer.addSubview(dateTimePicker)
            
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            timePicker.translatesAutoresizingMaskIntoConstraints = false
            dateTimePicker.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                datePicker.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                datePicker.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                
                timePicker.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: padding),
                timePicker.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                
                dateTimePicker.topAnchor.constraint(equalTo: timePicker.bottomAnchor, constant: padding),
                dateTimePicker.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                
                elementsContainer.bottomAnchor.constraint(equalTo: dateTimePicker.bottomAnchor, constant: padding)
            ])
            
        case "XCUIPageIndicator":
            // Add page indicator
            let pageControl = UIPageControl()
            pageControl.numberOfPages = 5
            pageControl.currentPage = 2
            pageControl.pageIndicatorTintColor = .systemGray3
            pageControl.currentPageIndicatorTintColor = .systemBlue
            pageControl.accessibilityIdentifier = "page_control"
            
            elementsContainer.addSubview(pageControl)
            
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                pageControl.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                pageControl.centerXAnchor.constraint(equalTo: elementsContainer.centerXAnchor),
                pageControl.heightAnchor.constraint(equalToConstant: 50),
                
                elementsContainer.bottomAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: padding)
            ])
            
        case "XCUIScrollView":
            // Add scroll view
            let nestedScrollView = UIScrollView()
            nestedScrollView.backgroundColor = .systemBackground
            nestedScrollView.layer.borderWidth = 1
            nestedScrollView.layer.borderColor = UIColor.systemGray3.cgColor
            nestedScrollView.accessibilityIdentifier = "nested_scroll_view"
            
            let nestedContentView = UIView()
            nestedContentView.backgroundColor = .systemBackground
            
            elementsContainer.addSubview(nestedScrollView)
            nestedScrollView.addSubview(nestedContentView)
            
            nestedScrollView.translatesAutoresizingMaskIntoConstraints = false
            nestedContentView.translatesAutoresizingMaskIntoConstraints = false
            
            // Add content to the nested scroll view
            let scrollContent = UILabel()
            scrollContent.text = "This is content inside a nested scroll view. This requires scrolling to see all of the content. You can use this to test scroll-related interactions with XCUITest. Scroll down to see more content. This is more content to ensure we need to scroll. Keep scrolling to see even more content at the bottom of this scroll view."
            scrollContent.numberOfLines = 0
            scrollContent.accessibilityIdentifier = "scroll_content"
            
            nestedContentView.addSubview(scrollContent)
            scrollContent.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                nestedScrollView.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                nestedScrollView.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                nestedScrollView.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                nestedScrollView.heightAnchor.constraint(equalToConstant: 200),
                
                nestedContentView.topAnchor.constraint(equalTo: nestedScrollView.topAnchor),
                nestedContentView.leadingAnchor.constraint(equalTo: nestedScrollView.leadingAnchor),
                nestedContentView.trailingAnchor.constraint(equalTo: nestedScrollView.trailingAnchor),
                nestedContentView.widthAnchor.constraint(equalTo: nestedScrollView.widthAnchor),
                
                scrollContent.topAnchor.constraint(equalTo: nestedContentView.topAnchor, constant: 10),
                scrollContent.leadingAnchor.constraint(equalTo: nestedContentView.leadingAnchor, constant: 10),
                scrollContent.trailingAnchor.constraint(equalTo: nestedContentView.trailingAnchor, constant: -10),
                scrollContent.bottomAnchor.constraint(equalTo: nestedContentView.bottomAnchor, constant: -10),
                
                // Make content tall enough to scroll
                nestedContentView.heightAnchor.constraint(equalToConstant: 400),
                
                elementsContainer.bottomAnchor.constraint(equalTo: nestedScrollView.bottomAnchor, constant: padding)
            ])
            
        
            
        default:
            // Generic placeholder for any other elements
            let placeholderLabel = UILabel()
            placeholderLabel.text = "This is a placeholder for \(displayName) elements"
            placeholderLabel.textAlignment = .center
            placeholderLabel.numberOfLines = 0
            placeholderLabel.accessibilityIdentifier = "placeholder_label"
            
            elementsContainer.addSubview(placeholderLabel)
            placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                placeholderLabel.topAnchor.constraint(equalTo: elementsContainer.topAnchor, constant: padding),
                placeholderLabel.leadingAnchor.constraint(equalTo: elementsContainer.leadingAnchor, constant: padding),
                placeholderLabel.trailingAnchor.constraint(equalTo: elementsContainer.trailingAnchor, constant: -padding),
                placeholderLabel.heightAnchor.constraint(equalToConstant: 200),
                
                elementsContainer.bottomAnchor.constraint(equalTo: placeholderLabel.bottomAnchor, constant: padding)
            ])
        }
        
        // Set final contentView height
        contentView.bottomAnchor.constraint(equalTo: elementsContainer.bottomAnchor, constant: 20).isActive = true
    }
    
    // MARK: - Helper Methods
    @objc private func showAlert() {
        let alert = UIAlertController(title: "Sample Alert",
                                      message: "This is a sample alert to demonstrate XCUITest automation.",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func showActionSheet() {
        let actionSheet = UIAlertController(title: "Sample Action Sheet",
                                            message: "This is a sample action sheet for XCUITest automation.",
                                            preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Option 1", style: .default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Option 2", style: .default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    private func createTabItem(imageName: String, title: String) -> UIView {
        let tabItem = UIView()
        
        let tabImageView = UIImageView(image: UIImage(systemName: imageName))
        tabImageView.tintColor = .systemBlue
        tabImageView.contentMode = .scaleAspectFit
        tabImageView.accessibilityIdentifier = "\(title.lowercased())_tab_icon"
        
        let tabLabel = UILabel()
        tabLabel.text = title
        tabLabel.textAlignment = .center
        tabLabel.font = UIFont.systemFont(ofSize: 12)
        tabLabel.accessibilityIdentifier = "\(title.lowercased())_tab_label"
        
        tabItem.addSubview(tabImageView)
        tabItem.addSubview(tabLabel)
        
        tabImageView.translatesAutoresizingMaskIntoConstraints = false
        tabLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabImageView.topAnchor.constraint(equalTo: tabItem.topAnchor, constant: 5),
            tabImageView.centerXAnchor.constraint(equalTo: tabItem.centerXAnchor),
            tabImageView.widthAnchor.constraint(equalToConstant: 24),
            tabImageView.heightAnchor.constraint(equalToConstant: 24),
            
            tabLabel.topAnchor.constraint(equalTo: tabImageView.bottomAnchor, constant: 2),
            tabLabel.centerXAnchor.constraint(equalTo: tabItem.centerXAnchor),
        ])
        
        return tabItem
    }

}

