//
//  TestAppDemoUITests.swift
//  TestAppDemoUITests
//
//  Created by Roman Pobotin on 26.04.2025.
//

import XCTest

class LoginTests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testLoginScreen() {
        // Test login functionality
        let usernameField = app.textFields["username_field"]
        let passwordField = app.secureTextFields["password_field"]
        let loginButton = app.buttons["login_button"]
        
        XCTAssertTrue(usernameField.exists)
        XCTAssertTrue(passwordField.exists)
        XCTAssertTrue(loginButton.exists)
        
        usernameField.tap()
        usernameField.typeText("testuser")
        
        passwordField.tap()
        passwordField.typeText("password123")
        
        loginButton.tap()
        
        // Verify we're on the Home screen
        XCTAssertTrue(app.staticTexts["welcome_label"].waitForExistence(timeout: 2))
    }
}
