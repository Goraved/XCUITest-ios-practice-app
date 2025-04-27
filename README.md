# iOS Test Automation Practice Project

## Overview

This repository contains an iOS application (`TestAppDemo`) built with UIKit and Swift, along with a corresponding UI test suite (`TestAppDemoUITests`) using Apple's XCUITest framework.

The primary purpose of this project is to serve as a practical learning resource and sandbox environment for:

* Understanding iOS application structure (UIKit, View Controllers, Navigation).
* Practicing UI test automation for iOS using XCUITest and Swift.
* Experimenting with different testing patterns, such as the Page Object Model.
* Learning how to identify and interact with various standard iOS UI elements in tests.

## Repository Structure

* **`/TestAppDemo`**: Contains the source code for the iOS demo application.
    * See `TestAppDemo/README.md` for details about the app's features and structure. [cite: 1]
* **`/TestAppDemoUITests`**: Contains the XCUITest suite for the demo application.
    * See `TestAppDemoUITests/README.md` for a comprehensive guide on XCUITest with Swift, including setup, element interaction, assertions, and advanced topics. [cite: 2]
    * **`/TestAppDemoUITests/SwiftInstruction.md`**: A guide specifically designed for Python automation engineers transitioning to Swift and XCUITest, comparing syntax and concepts. [cite: 3]

## Getting Started

1.  **Prerequisites:** Ensure you have Xcode installed on your macOS machine.
2.  **Clone the repository:**
    ```bash
    git clone <your-repository-url>
    cd <repository-directory>
    ```
3.  **Open the project:** Locate the `.xcodeproj` or `.xcworkspace` file within the `TestAppDemo` directory and open it with Xcode.
4.  **Build the project:** Select an iOS simulator or a connected device and build the project (Product > Build or Cmd+B).
5.  **Run the App:** Run the `TestAppDemo` target (Product > Run or Cmd+R).
6.  **Run the UI Tests:**
    * Select the `TestAppDemoUITests` target.
    * Run the tests via Product > Test (Cmd+U) or by clicking the diamond icons next to test classes or methods in the Test Navigator (Cmd+6). Refer to the `TestAppDemoUITests/README.md` for more details on running tests. [cite: 2]
