# XCUITest with Swift: A Guide

This guide provides instructions and examples on how to use Apple's XCUITest framework with Swift to write UI tests for your iOS mobile application.

## Table of Contents

1.  [Introduction](#introduction)
2.  [Setting Up](#setting-up)
3.  [Writing Your First Test](#writing-your-first-test)
4.  [Finding UI Elements (Locators)](#finding-ui-elements-locators)
5.  [Interacting with UI Elements](#interacting-with-ui-elements)
6.  [Writing Assertions (Checks)](#writing-assertions-checks)
7.  [Handling Scrolling](#handling-scrolling)
8.  [Advanced Topics (Bonus)](#advanced-topics-bonus)
    * [Fixtures (Setup & Teardown)](#fixtures-setup--teardown)
    * [Running Tests in Parallel](#running-tests-in-parallel)
    * [Parametrizing Tests](#parametrizing-tests)
    * [Generating Reports](#generating-reports)
    * [Rerunning Failed Tests](#rerunning-failed-tests)

---

## Introduction

XCUITest is Apple's UI testing framework integrated directly into Xcode. It allows you to write tests in Swift or Objective-C to interact with your app's UI just like a real user would, ensuring your application behaves as expected from the user's perspective.

## Setting Up

1.  **Create a UI Testing Target:** If you don't already have one, go to your Xcode project settings, click the '+' button at the bottom of the Targets list, and select "UI Testing Bundle".
2.  **Import XCTest:** Ensure your test files import the XCTest framework: `import XCTest`.

## Writing Your First Test

A typical XCUITest class looks like this:

```swift
import XCTest

class YourAppUITests: XCTestCase {

    let app = XCUIApplication() // Represents your application

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // Launch the application before each test
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExampleFunctionality() throws {
        // UI tests must launch the application to perform tests on it.

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Example: Tap a login button and verify a welcome message appears
        let loginButton = app.buttons["login_button"] // Find button by accessibility identifier
        XCTAssertTrue(loginButton.exists, "Login button should exist") // Assert button exists
        loginButton.tap() // Tap the button

        let welcomeLabel = app.staticTexts["welcome_label"] // Find label by accessibility identifier
        // Wait for the label to appear (up to 5 seconds) and assert it exists
        XCTAssertTrue(welcomeLabel.waitForExistence(timeout: 5), "Welcome label should appear after login")
    }
}

```
*This structure includes setup (`setUpWithError`) and teardown (`tearDownWithError`) methods, and individual test functions (`testExampleFunctionality`).*

## Finding UI Elements (Locators)

The most reliable way to find UI elements in XCUITest is using **Accessibility Identifiers**.

1.  **Set Identifiers in Code:** Assign a unique `accessibilityIdentifier` string to your UI elements in your app's main codebase.

    *Example from `UIElementDetailViewController.swift`:* [cite: 1]
    ```swift
    // In your ViewController
    let regularButton = UIButton(type: .system)
    regularButton.setTitle("Regular Button", for: .normal)
    regularButton.accessibilityIdentifier = "regular_button" // <--- Set identifier here [cite: 1]

    let usernameField = UITextField()
    usernameField.placeholder = "Username"
    usernameField.accessibilityIdentifier = "username_field" // <--- Set identifier here [cite: 1]
    ```

2.  **Query Elements in Tests:** Use the identifier in your test code to get a reference (`XCUIElement`) to the element.

    *Example from `TestAppDemoUITests.swift`:* [cite: 2]
    ```swift
    // In your XCUITest file
    let app = XCUIApplication() // [cite: 2]

    // Find elements by type and identifier
    let myButton = app.buttons["regular_button"]
    let usernameInput = app.textFields["username_field"] // [cite: 2]
    let passwordInput = app.secureTextFields["password_field"] // Use secureTextFields for password fields [cite: 2]
    let welcomeMessage = app.staticTexts["welcome_message"] // Use staticTexts for UILabels
    let myImage = app.images["profile_image"]
    let mySwitch = app.switches["settings_switch"]
    let mySlider = app.sliders["volume_slider"]
    let mainScrollView = app.scrollViews["main_scroll_view"]
    // ... and so on for other element types (tables, collectionViews, alerts, etc.)
    ```

## Interacting with UI Elements

Once you have an `XCUIElement`, you can perform various actions:

* **Tapping:**
    ```swift
    myButton.tap() // Simple tap
    app.alerts["Confirmation Alert"].buttons["OK"].tap() // Tap a button within an alert
    ```
* **Typing Text:**
    ```swift
    usernameInput.tap() // First tap to focus [cite: 2]
    usernameInput.typeText("myUsername") // Type the text [cite: 2]
    passwordInput.tap() // [cite: 2]
    passwordInput.typeText("myPassword123") // [cite: 2]
    ```
* **Swiping:**
    ```swift
    app.swipeLeft() // Swipe the whole app window
    myScrollView.swipeUp() // Swipe a specific scrollable element
    myScrollView.swipeDown()
    ```
* **Adjusting Sliders/Pickers:**
    ```swift
    mySlider.adjust(toNormalizedSliderPosition: 0.8) // Set slider to 80%
    // For pickers (like date pickers or custom pickers)
    app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "Option 2") // Select by value
    app.datePickers.element.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "December") // Set month
    ```
* **Toggling Switches:**
    ```swift
    // Tapping a switch toggles it. You can also set its value based on its current state.
    // Assuming the switch value is represented by '0' (off) or '1' (on) in its `value` attribute.
    if let switchValue = mySwitch.value as? String, switchValue == "0" {
        mySwitch.tap() // Tap to turn on if it's off
    }
    ```

## Writing Assertions (Checks)

XCTest provides various `XCTAssert` functions to verify the state of your UI:

* **Existence:** Check if an element is present or not.
    ```swift
    XCTAssertTrue(myButton.exists, "The button should exist.") // Similar check used in [cite: 2]
    XCTAssertFalse(app.staticTexts["Error Message"].exists, "No error message should be displayed.")
    // Wait for an element to appear/disappear
    XCTAssertTrue(app.staticTexts["Success"].waitForExistence(timeout: 5), "Success message should appear within 5 seconds.") // Similar check used in [cite: 2]
    ```
* **Hittable/Enabled:** Check if an element can be interacted with.
    ```swift
    XCTAssertTrue(myButton.isHittable, "The button should be tappable.")
    XCTAssertTrue(submitButton.isEnabled, "Submit button should be enabled after filling form.")
    ```
* **Labels/Values:** Check the text content of labels, buttons, or values of elements.
    ```swift
    XCTAssertEqual(welcomeMessage.label, "Welcome, User!", "Welcome message text is incorrect.")
    XCTAssertEqual(mySwitch.value as? String, "1", "The switch should be ON.") // Value is often String "0" or "1"
    ```
* **Selection:** Check if an element (like a tab or segmented control button) is selected.
    ```swift
    XCTAssertTrue(app.tabBars.buttons["Profile"].isSelected, "Profile tab should be selected.")
    ```

## Handling Scrolling

If an element is not visible on the screen, you need to scroll to find it.

* **Scroll a View:** Swipe up or down on a `UIScrollView`, `UITableView`, or `UICollectionView`.
    ```swift
    let myScrollView = app.scrollViews["element_detail_scrollview"] // Get the scroll view [cite: 1]
    let bottomElement = app.buttons["submit_button"]

    // Keep swiping up until the element exists or a limit is reached
    while !bottomElement.exists {
        myScrollView.swipeUp()
        // Optional: Add a check to prevent infinite loops if the element is truly missing
    }
    // Now interact with bottomElement
    bottomElement.tap()
    ```
* **Scroll Table/Collection View to Cell:**
    ```swift
    let myTable = app.tables["my_table_view"]
    let targetCell = myTable.cells.staticTexts["Item 50"]

    while !targetCell.isHittable { // Check if hittable, not just exists
        myTable.swipeUp()
        // Optional: Add safety break
    }
    targetCell.tap()
    ```

---

## Advanced Topics (Bonus)

### Fixtures (Setup & Teardown)

XCTest uses `setUp()` / `setUpWithError()` and `tearDown()` / `tearDownWithError()` methods for managing test state.

* **Per-Test Setup/Teardown:** Methods like `setUpWithError()` and `tearDownWithError()` run *before* and *after* **each** test function (`test...()`) in the class. Use these for resetting state, launching the app, logging in/out for each test scenario. [cite: 2]
    ```swift
    override func setUpWithError() throws { // setUp() used in [cite: 2]
        continueAfterFailure = false // [cite: 2]
        app.launchArguments += ["-resetData"] // Example: Launch argument to reset app state
        app.launch() // [cite: 2]
        // Perform login if needed for most tests
    }

    override func tearDownWithError() throws {
        // Perform logout, cleanup files, etc. after each test
    }
    ```
* **Per-Class Setup/Teardown:** Use `class func setUp()` and `class func tearDown()` to run code *once* before any tests in the class start and once after all tests in the class finish. This is less common in UI testing but can be used for expensive, shared setup that doesn't interfere between tests.
    ```swift
    override class func setUp() {
        super.setUp()
        // Perform one-time setup for the entire test class
        // Be cautious with shared state here
    }

    override class func tearDown() {
        // Perform one-time cleanup after all tests in the class
        super.tearDown()
    }
    ```

### Running Tests in Parallel

Xcode supports running UI tests in parallel on multiple simulator instances to significantly speed up execution time.

1.  **Enable in Scheme:** Go to Product > Scheme > Edit Scheme.
2.  Select the "Test" action on the left.
3.  Click the "Options" button next to your UI Testing target bundle.
4.  Check "Execute in parallel on Simulator".
5.  Optionally check "Randomize execution order".

*Note: Ensure your tests are independent and don't rely on shared state that could cause conflicts when run in parallel.*
*Third-party tools and CI platforms like CircleCI, Appium, and BrowserStack also offer advanced parallelization and sharding capabilities.*

### Parametrizing Tests

Traditional XCTest lacks built-in test parametrization. However, Apple's newer **Swift Testing** framework (introduced alongside Swift 5.10/6.0, requires appropriate Xcode version) supports it natively.

*Example using Swift Testing:*
```swift
// NOTE: This requires the Swift Testing framework, not classic XCTest
import Testing // Import the new framework

struct FeatureTests {

    @Test("Test Feature Access", arguments: [Feature.userDefaultsEditor, .networkMonitor]) // Provide arguments
    func testLimitedFreeUsage(_ feature: Feature) async throws {
        // This test runs twice, once for each feature
        #expect(feature.numberOfFreeTries > 0) // Use #expect for assertions
    }

    @Test("Test Different Trial Limits", arguments: zip([.editor, .monitor], [10, 5])) // Zip multiple argument sets
    func testTrialLimits(feature: Feature, expectedTries: Int) {
         #expect(feature.trialLimit == expectedTries)
    }
}
```
*This allows running the same test logic with different inputs, reducing boilerplate.*

### Generating Reports

Xcode generates `.xcresult` bundles after test runs, containing detailed logs, performance metrics, and screenshots on failure.

* **View in Xcode:** Open the Report Navigator (Cmd + 9) to view results.
* **Command Line:** `xcodebuild` produces an `.xcresult` file in the derived data path or a specified location (`-resultBundlePath`).
* **HTML/JUnit Reports:** For CI/CD or easier sharing, use tools to convert `.xcresult`:
    * **xcpretty:** Formats `xcodebuild` output and can generate simple JUnit or HTML reports.
        ```bash
        # Install: gem install xcpretty
        xcodebuild test ... | xcpretty -r junit -r html
        ```
    * **XCTestHTMLReport:** Generates more detailed HTML reports directly from the `.xcresult` bundle.
        ```bash
        # Install: brew install xctesthtmlreport
        xctesthtmlreport -r YourPath/DerivedData/.../Logs/Test/*.xcresult
        ```
* **CI/CD Integration:** Platforms often have built-in steps or plugins for parsing and displaying XCUITest results (e.g., using xcpretty or JUnit format). BrowserStack also provides test reporting features.

### Rerunning Failed Tests

Handling flaky tests (tests that sometimes pass and sometimes fail) often involves retries.

* **Xcode Test Plans:** Starting with Xcode 13, you can configure automatic retries within a Test Plan (`.xctestplan` file).
    1.  Create a Test Plan (File > New > File > Test Plan).
    2.  Add your test target.
    3.  Go to the "Configurations" tab.
    4.  Enable "Test Repetitions" and set the mode to "Retry on Failure". Set a maximum repetition count.
* **Command Line:** Use `xcodebuild` flags:
    ```bash
    # Retry each failed test up to 3 times (default max if not specified with -test-iterations)
    xcodebuild test -scheme YourScheme -destination '...' -retry-tests-on-failure

    # Retry each failed test up to 5 times
    xcodebuild test -scheme YourScheme -destination '...' -retry-tests-on-failure -test-iterations 5
    ```
* **Manual Rerun in Xcode:** In the Test Navigator (Cmd + 6), filter for failed tests, right-click, and choose "Run Again". The shortcut `⌃ + ⌥ + ⌘ + G` reruns the last run tests.
* **Custom Scripts:** For more complex logic, scripts can parse `xcodebuild` output or `.xcresult` files to identify and rerun specific failed tests using the `-only-testing:` flag.


