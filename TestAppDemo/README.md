# iOS Test Automation Practice App (UIKit)

## Purpose

This iOS application serves as a dedicated practice ground for learning and experimenting with iOS UI test automation, specifically using Apple's **XCUITest** framework. It provides various standard UIKit UI elements and screens commonly encountered in iOS applications.

The primary goal is to offer a stable target application where developers and QA engineers can:

* Practice writing XCUITest tests in Swift for different UI components (Buttons, TextFields, Tables, Switches, etc.).
* Learn common XCUITest queries, actions (taps, swipes, typing text), and assertions (existence, hittable, label/value matching).
* Experiment with page object models or screen interaction patterns in UI testing.
* Understand how to identify UI elements reliably using `accessibilityIdentifier`.
* Test navigation flows between different `UIViewController` instances within a `UINavigationController`.

## Features

The application includes the following screens and functionalities, built with UIKit:

1.  **Login Screen (`LoginViewController`):** Basic username/password input fields (`UITextField`), login button (`UIButton`), and placeholder buttons for "Forgot Password" and "Register". Includes basic validation.
2.  **Home Screen (`HomeViewController`):** A welcome message (`UILabel`), a segmented control (`UISegmentedControl`) for potential view switching, and a custom view acting as a tab bar containing buttons (`UIButton`) for navigating to Features, Profile, and initiating Logout.
3.  **Features Screen (`FeaturesViewController`):** A scrollable list (`UITableView`) displaying various XCUITest element types (e.g., `XCUIButton`, `XCUITextField`). Tapping an item navigates to the detail screen.
4.  **UI Element Detail Screen (`UIElementDetailViewController`):** Dynamically displays examples of the selected UI element type from the Features screen within a `UIScrollView`. This screen is designed to showcase various UIKit elements for testing (e.g., `UIButton`, `UILabel`, `UIImageView`, `UITextField`, `UISwitch`, `UISlider`, `UIStepper`, `UIPickerView`, `UIDatePicker`, etc.). Includes functionality to show Alerts (`UIAlertController`).
5.  **Profile Screen (`ProfileViewController`):** A static display screen showing user profile information (`UIImageView`, `UILabel`, `UITextView`) and buttons (`UIButton`) for placeholder actions like "Edit Profile" and "Settings".

*(Note: Placeholder screens like `ForgotPasswordViewController`, `RegisterViewController`, and `SettingsViewController` might be referenced but are not fully implemented in the provided code.)*

## Technology Stack

* **Language:** Swift
* **UI Toolkit:** UIKit
* **Architecture:** Model-View-Controller (MVC) - Primarily ViewControllers managing UI and basic logic.
* **Navigation:** `UINavigationController`
* **UI Testing:** XCUITest Framework
* **Build System:** Xcode Build System

## Project Structure

The project follows a standard UIKit structure:

* **`AppDelegate.swift`:** Handles application lifecycle events (initial setup without scenes).
* **`SceneDelegate.swift`:** Handles scene-based lifecycle events (used if scenes are enabled, though `AppDelegate` seems to handle window setup directly in the provided code).
* **View Controllers (`*.swift` files):**
    * `LoginViewController.swift`
    * `HomeViewController.swift`
    * `FeaturesViewController.swift`
    * `UIElementDetailViewController.swift`
    * `ProfileViewController.swift`
    * *(Other supporting/placeholder VCs)*
* **`Assets.xcassets`:** Contains app icons, images (if any).
* **`LaunchScreen.storyboard` / `Main.storyboard` (Optional):** Storyboards might be used for initial setup or layout, although the provided code heavily uses programmatic UI setup.
* **`Info.plist`:** Application configuration file.
* **`TestPracticeAppUITests/` (Separate Target):** Contains XCUITest classes and methods.

## Setup Instructions

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd <repository-directory>
    ```
2.  **Open in Xcode:**
    * Launch Xcode.
    * Select "Open a project or file" (`File > Open...`).
    * Navigate to and select the `.xcodeproj` or `.xcworkspace` file within the cloned repository directory.
3.  **Build the Project:**
    * Select a target simulator or connect a physical iOS device.
    * Ensure the correct project and target are selected in the Xcode scheme selector.
    * Build the project using `Product > Build` (Cmd+B).

## Running the App

1.  Select an iOS simulator or a connected physical device from the scheme selector dropdown in Xcode's toolbar.
2.  Click the "Run" button (triangle icon) or use `Product > Run` (Cmd+R).

## Running Tests (XCUITest)

1.  **Ensure UI Test Target Exists:** Verify there is a UI Test target (e.g., `TestPracticeAppUITests`) in your project navigator. If not, add one via `File > New > Target...` and select "UI Testing Bundle".
2.  **Run all UI tests:**
    * Go to the Test Navigator (diamond icon in the left sidebar).
    * Right-click on the UI test target folder or a specific test class.
    * Select "Run '[Target/Class Name]'".
    * Alternatively, use `Product > Test` (Cmd+U). This runs all tests (Unit and UI) by default. You can configure the scheme to run only UI tests if needed.
3.  **Run a specific test method:**
    * Open the desired XCUITest file (e.g., `LoginScreenTests.swift`).
    * Click the small diamond icon next to the test function (`func test...()`) or the test class (`class LoginScreenTests...`).
    * Select "Run".

Test results will appear in the Test Navigator and the Debug Console.

## Testing Identifiers

Reliable UI testing with XCUITest depends on uniquely identifying UI elements. This project primarily uses:

* **`accessibilityIdentifier`:** This property is explicitly set on `UIView` subclasses (like `UILabel`, `UIButton`, `UITextField`, `UITableView`, etc.) within the code (e.g., `loginButton.accessibilityIdentifier = "login_button"`).
* **XCUITest Queries:** Tests find elements using queries based on these identifiers:
    ```swift
    let app = XCUIApplication()
    let loginButton = app.buttons["login_button"]
    let usernameField = app.textFields["username_field"]
    // etc.
    ```

Consistent and descriptive `accessibilityIdentifier` values are crucial for writing robust and maintainable XCUITest suites. Refer to the `setupUI` methods within each `UIViewController` for the specific identifiers assigned.
