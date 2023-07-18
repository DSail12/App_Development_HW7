//
//  ViewControllerTests.swift
//  HW7
//
//  Created by Eugene Zvyagin on 18.07.2023.
//

import XCTest

@testable import GB.CreateApp
class ViewControllerTests: XCTestCase {
    var viewController: ViewController!
    override func setUpWithError() throws {
        viewController = ViewController()
        // Perform additional setup if needed
    }
    override func tearDownWithError() throws {
        viewController = nil
        // Perform additional cleanup if needed
    }
    func testWebViewLoad() {
        // Test the loading of the web view
        viewController.loadViewIfNeeded()
        XCTAssertNotNil(viewController.webView)
    }
    func testTap() {
        // Test the tap method
        viewController.tap()
        let tabBarController = viewController.view.window?.rootViewController as? UITabBarController
        XCTAssertNotNil(tabBarController)
        XCTAssertEqual(tabBarController?.viewControllers?.count, 3)
        // Perform additional assertions as needed
    }
}
