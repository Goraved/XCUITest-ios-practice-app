# Swift and XCUITest Guide for Python Automation Engineers

## Basic Syntax Comparison

### Variables and Data Types

**Python:**
```python
name = "John"  # String
age = 30  # Integer
height = 1.85  # Float
is_developer = True  # Boolean
```

**Swift:**
```swift
let name = "John"  // String (immutable)
var age = 30  // Int (mutable)
var height = 1.85  // Double
var isDeveloper = true  // Bool
```

Key differences:
- Swift uses `let` for constants (immutable) and `var` for variables (mutable)
- Swift is strongly typed but has type inference, so explicit type annotations are optional
- Optional type annotation: `var age: Int = 30`
- Naming convention is camelCase instead of snake_case

### Collections

**Python:**
```python
my_list = [1, 2, 3]
my_dict = {"name": "John", "age": 30}
my_tuple = (1, 2, 3)
my_set = {1, 2, 3}
```

**Swift:**
```swift
let myArray = [1, 2, 3]  // Array
let myDictionary = ["name": "John", "age": 30]  // Dictionary
let myTuple = (1, "hello", true)  // Tuple
let mySet: Set<Int> = [1, 2, 3]  // Set
```

### Loops

**Python:**
```python
# For loop with range
for i in range(5):
    print(i)

# For loop with list
for item in my_list:
    print(item)

# While loop
i = 0
while i < 5:
    print(i)
    i += 1
```

**Swift:**
```swift
// For loop with range
for i in 0..<5 {
    print(i)
}

// For loop with array
for item in myArray {
    print(item)
}

// While loop
var i = 0
while i < 5 {
    print(i)
    i += 1
}
```

### Conditions

**Python:**
```python
if age > 18:
    print("Adult")
elif age > 12:
    print("Teenager")
else:
    print("Child")
```

**Swift:**
```swift
if age > 18 {
    print("Adult")
} else if age > 12 {
    print("Teenager")
} else {
    print("Child")
}
```

### Exception Handling

**Python:**
```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")
except Exception as e:
    print(f"Error: {e}")
finally:
    print("This runs regardless of exception")
```

**Swift:**
```swift
do {
    // Code that might throw an error
    let data = try getData()
    processData(data)
} catch DataError.invalidFormat {
    print("Invalid data format")
} catch {
    print("Error: \(error)")
}
```

Swift uses a different error handling mechanism with `throws`, `try`, and `catch`.

### Filtering Objects (Comprehension)

**Python:**
```python
# List comprehension
even_numbers = [x for x in range(10) if x % 2 == 0]

# Filter with lambda
filtered = filter(lambda x: x > 5, [1, 6, 3, 8, 2])
```

**Swift:**
```swift
// Filter method
let evenNumbers = (0..<10).filter { $0 % 2 == 0 }

// Map method
let doubled = [1, 2, 3].map { $0 * 2 }

// Reduce method
let sum = [1, 2, 3].reduce(0) { $0 + $1 }
```

Swift uses higher-order functions like `filter`, `map`, and `reduce` instead of list comprehensions.

### Functions

**Python:**
```python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}!"

result = greet("John")
```

**Swift:**
```swift
func greet(name: String, greeting: String = "Hello") -> String {
    return "\(greeting), \(name)!"
}

let result = greet(name: "John")
```

Key differences:
- Swift has named parameters by default
- Return type is explicitly declared with `->` 
- String interpolation uses `\(variable)` instead of f-strings

### Classes and Methods

**Python:**
```python
class Person:
    def __init__(self, name, age):
        self._name = name
        self._age = age
    
    @property
    def name(self):
        return self._name
    
    @property
    def age(self):
        return self._age
    
    def greet(self):
        return f"Hello, I'm {self.name}!"
```

**Swift:**
```swift
class Person {
    private let name: String
    private let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // Properties in Swift
    var fullName: String {
        return name
    }
    
    var description: String {
        return "Person named \(name), age \(age)"
    }
    
    func greet() -> String {
        return "Hello, I'm \(name)!"
    }
}
```

Swift uses computed properties instead of Python's `@property` decorator.

## XCUITest Framework Basics

### Test Class Structure

```swift
import XCTest

class MyAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testExample() {
        // Test code goes here
    }
}
```

### Finding Elements

```swift
// Find by accessibility identifier (recommended)
let loginButton = app.buttons["login_button"]

// Find by type and predicate
let button = app.buttons.element(matching: .button, identifier: "login_button")

// Find by text
let buttonWithText = app.buttons["Login"]

// Find by type and index
let firstButton = app.buttons.element(boundBy: 0)
```

### Interacting with Elements

```swift
// Tapping
app.buttons["login_button"].tap()

// Text entry
app.textFields["username_field"].tap()
app.textFields["username_field"].typeText("testuser")

// Clearing text
app.textFields["username_field"].tap()
app.textFields["username_field"].clearText() // Extension method needed

// Swipe actions
app.swipeUp()
app.swipeDown()
app.swipeLeft()
app.swipeRight()
```

### Waiting and Assertions

```swift
// Wait for existence
let exists = app.buttons["login_button"].waitForExistence(timeout: 5)
XCTAssertTrue(exists)

// Check if element exists
XCTAssertTrue(app.staticTexts["welcome_message"].exists)

// Check text value
XCTAssertEqual(app.staticTexts["result_label"].label, "Success")

// Check if enabled/disabled
XCTAssertTrue(app.buttons["submit_button"].isEnabled)
```

## Page Object Model in XCUITest

### Basic Page Object Structure

```swift
class LoginPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Elements as computed properties
    var usernameField: XCUIElement {
        return app.textFields["username_field"]
    }
    
    var passwordField: XCUIElement {
        return app.secureTextFields["password_field"]
    }
    
    var loginButton: XCUIElement {
        return app.buttons["login_button"]
    }
    
    // Actions
    func enterCredentials(username: String, password: String) {
        usernameField.tap()
        usernameField.typeText(username)
        
        passwordField.tap()
        passwordField.typeText(password)
    }
    
    func submitLogin() {
        loginButton.tap()
    }
    
    func login(username: String, password: String) {
        enterCredentials(username: username, password: password)
        submitLogin()
    }
}
```

### Using the Page Object Model in Tests

```swift
import XCTest

class LoginTests: XCTestCase {
    
    let app = XCUIApplication()
    var loginPage: LoginPage!
    var homePage: HomePage!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
        loginPage = LoginPage(app: app)
        homePage = HomePage(app: app)
    }
    
    func testValidLogin() {
        // When
        loginPage.login(username: "testuser", password: "password123")
        
        // Then
        XCTAssertTrue(homePage.welcomeMessage.exists)
        XCTAssertEqual(homePage.welcomeMessage.label, "Welcome, testuser!")
    }
}
```

### Extending XCUIElement for Custom Methods

```swift
extension XCUIElement {
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }
        
        self.tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        self.typeText(deleteString)
    }
    
    func forceTap() {
        if self.isHittable {
            self.tap()
        } else {
            let coordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            coordinate.tap()
        }
    }
}
```

## Complete Example: Testing the TestAppDemo

Let's build a complete test suite for the TestAppDemo app in the files you provided:

```swift
import XCTest

class TestAppDemoUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testLogin() {
        // Given
        let loginPage = LoginPage(app: app)
        
        // When
        loginPage.login(username: "testuser", password: "password123")
        
        // Then
        let homePage = HomePage(app: app)
        XCTAssertTrue(homePage.welcomeLabel.exists)
        XCTAssertEqual(homePage.welcomeLabel.label, "Welcome to Test Automation App")
    }
    
    func testNavigation() {
        // Login first
        let loginPage = LoginPage(app: app)
        loginPage.login(username: "testuser", password: "password123")
        
        // Navigate to Features
        let homePage = HomePage(app: app)
        homePage.navigateToFeatures()
        
        // Check features page
        let featuresPage = FeaturesPage(app: app)
        XCTAssertTrue(featuresPage.featuresTableView.exists)
        
        // Select a feature
        featuresPage.selectFeature(at: 0)
        
        // Check feature detail page
        let featureDetailPage = FeatureDetailPage(app: app)
        XCTAssertTrue(featureDetailPage.featureDetailTitle.exists)
    }
    
    func testRegistration() {
        // Navigate to Register
        let loginPage = LoginPage(app: app)
        loginPage.tapRegisterButton()
        
        // Fill registration form
        let registerPage = RegisterPage(app: app)
        registerPage.fillRegistrationForm(
            name: "John Doe",
            email: "john@example.com",
            password: "password123",
            confirmPassword: "password123"
        )
        
        // Accept terms
        registerPage.acceptTerms()
        
        // Submit registration
        registerPage.submitRegistration()
        
        // Verify navigation to home page
        let homePage = HomePage(app: app)
        XCTAssertTrue(homePage.welcomeLabel.exists)
    }
}
```

### Page Object Classes

```swift
// LoginPage.swift
class LoginPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Elements
    var usernameField: XCUIElement {
        return app.textFields["username_field"]
    }
    
    var passwordField: XCUIElement {
        return app.secureTextFields["password_field"]
    }
    
    var loginButton: XCUIElement {
        return app.buttons["login_button"]
    }
    
    var registerButton: XCUIElement {
        return app.buttons["register_button"]
    }
    
    var forgotPasswordButton: XCUIElement {
        return app.buttons["forgot_password_button"]
    }
    
    // Actions
    func login(username: String, password: String) {
        usernameField.tap()
        usernameField.typeText(username)
        
        passwordField.tap()
        passwordField.typeText(password)
        
        loginButton.tap()
    }
    
    func tapRegisterButton() {
        registerButton.tap()
    }
    
    func tapForgotPasswordButton() {
        forgotPasswordButton.tap()
    }
}

// HomePage.swift
class HomePage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Elements
    var welcomeLabel: XCUIElement {
        return app.staticTexts["welcome_label"]
    }
    
    var featuresButton: XCUIElement {
        return app.buttons["features_button"]
    }
    
    var profileButton: XCUIElement {
        return app.buttons["profile_button"]
    }
    
    var logoutButton: XCUIElement {
        return app.buttons["logout_button"]
    }
    
    var segmentedControl: XCUIElement {
        return app.segmentedControls["home_segmented_control"]
    }
    
    // Actions
    func navigateToFeatures() {
        featuresButton.tap()
    }
    
    func navigateToProfile() {
        profileButton.tap()
    }
    
    func logout() {
        logoutButton.tap()
    }
    
    func selectSegment(index: Int) {
        segmentedControl.buttons.element(boundBy: index).tap()
    }
}

// FeaturesPage.swift
class FeaturesPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Elements
    var featuresTableView: XCUIElement {
        return app.tables["features_table_view"]
    }
    
    func featureCell(at index: Int) -> XCUIElement {
        return app.tables.cells["feature_cell_\(index)"]
    }
    
    // Actions
    func selectFeature(at index: Int) {
        featureCell(at: index).tap()
    }
}

// FeatureDetailPage.swift
class FeatureDetailPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Elements
    var featureDetailTitle: XCUIElement {
        return app.staticTexts["element_title_label"]
    }
    
    var featureDetailDescription: XCUIElement {
        return app.staticTexts["element_description_label"]
    }
    
    var elementDetailScrollView: XCUIElement {
        return app.scrollViews["element_detail_scrollview"]
    }
}

// RegisterPage.swift
class RegisterPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Elements
    var nameField: XCUIElement {
        return app.textFields["register_name_field"]
    }
    
    var emailField: XCUIElement {
        return app.textFields["register_email_field"]
    }
    
    var passwordField: XCUIElement {
        return app.secureTextFields["register_password_field"]
    }
    
    var confirmPasswordField: XCUIElement {
        return app.secureTextFields["register_confirm_password_field"]
    }
    
    var termsSwitch: XCUIElement {
        return app.switches["terms_switch"]
    }
    
    var registerButton: XCUIElement {
        return app.buttons["register_submit_button"]
    }
    
    // Actions
    func fillRegistrationForm(name: String, email: String, password: String, confirmPassword: String) {
        nameField.tap()
        nameField.typeText(name)
        
        emailField.tap()
        emailField.typeText(email)
        
        passwordField.tap()
        passwordField.typeText(password)
        
        confirmPasswordField.tap()
        confirmPasswordField.typeText(confirmPassword)
    }
    
    func acceptTerms() {
        termsSwitch.tap()
    }
    
    func submitRegistration() {
        registerButton.tap()
    }
}
```

## Additional Key Concepts

### Handling Different Screen Sizes and Orientations

```swift
// Rotate device
XCUIDevice.shared.orientation = .landscapeLeft

// Check current orientation
if XCUIDevice.shared.orientation == .portrait {
    // Do something for portrait mode
}
```

### Testing App Launch Arguments and Environment

```swift
override func setUp() {
    super.setUp()
    
    let app = XCUIApplication()
    
    // Set launch arguments
    app.launchArguments = ["-UITesting"]
    
    // Set environment variables
    app.launchEnvironment = ["ENV_NAME": "TEST"]
    
    app.launch()
}
```

### Working with Tables and Collections

```swift
// Count cells
let count = app.tables.cells.count
XCTAssertEqual(count, 5)

// Scroll to find a cell
app.tables.cells["cell_not_visible"].scrollToElement()

// Custom scrollToElement extension
extension XCUIElement {
    func scrollToElement() {
        while !self.visible() {
            let startCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            let endCoordinate = app.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.2))
            startCoordinate.press(forDuration: 0.01, thenDragTo: endCoordinate)
        }
    }
    
    func visible() -> Bool {
        guard self.exists else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
    }
}
```

### Testing Network Conditions and Handling Alerts

```swift
// Handle system alerts
addUIInterruptionMonitor(withDescription: "Permission Alert") { (alert) -> Bool in
    let allowButton = alert.buttons["Allow"]
    if allowButton.exists {
        allowButton.tap()
        return true
    }
    return false
}
app.tap() // Triggers the interruption monitor

// Custom handling for alerts
func handleAlertIfPresent(withText text: String, tapButton buttonLabel: String) -> Bool {
    let alert = app.alerts.element
    if alert.exists && alert.staticTexts[text].exists {
        alert.buttons[buttonLabel].tap()
        return true
    }
    return false
}
```

## Differences from Python and Key Takeaways

1. **Type System**: Swift is strongly typed, whereas Python is dynamically typed
2. **Syntax**: Swift uses curly braces and doesn't rely on indentation for code blocks
3. **Properties**: Swift uses computed properties instead of Python's `@property` 
4. **Parameter Names**: Swift functions use named parameters by default
5. **Error Handling**: Swift uses `do`, `try`, `catch` instead of Python's `try`/`except`
6. **XCUITest Framework**: Similar to Selenium/Playwright but specific to iOS apps
7. **Access Identifiers**: In iOS, you use accessibility identifiers instead of CSS/XPath selectors

## Best Practices for XCUITest

1. Always use accessibility identifiers for element selection
2. Organize tests using the Page Object Model
3. Keep test methods focused on a single functionality
4. Use setUp and tearDown methods for common initialization and cleanup
5. Create helper extensions to simplify common actions
6. Wait for elements instead of using sleep
7. Handle alerts and system dialogs properly
8. Set up test data consistently with launchArguments or launchEnvironment

