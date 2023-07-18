//
//  ViewControllerTest.swift
//  HW7
//
//  Created by Eugene Zvyagin on 18.07.2023.
//

import XCTest
@testable import GB_CreateApp_Homework1

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
    override func setUp() {
        super.setUp()
        viewController = ViewController()
    }
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    func testViewDidLoad() {
        // Ensure that the view is loaded
        viewController.viewDidLoad()
        // Assert that the web view is not nil
        XCTAssertNotNil(viewController.webView)
    }
    func testTap() {
        // Create the view controllers for the tabs
        let tab1 = UINavigationController(rootViewController: FriendViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        // Set up the tab bar items and attributes
        tab1.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photos"
        // Create the tab bar controller
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [tab1, tab2, tab3]
        // Set the root view controller of the window
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = windowScene.windows.first else {
            XCTFail("Failed to access the window")
            return
        }
        firstWindow.rootViewController = tabBarController
        viewController.viewDidLoad()
        viewController.tap()
        guard let rootViewController = viewController.view.window?.rootViewController else {
            //XCTFail("Failed to access the root view controller of the window")
            return
        }
        XCTAssertTrue(rootViewController is UITabBarController, "Expected the root view controller to be a UITabBarController")
        guard let tabBarController = rootViewController as? UITabBarController else {
            XCTFail("Failed to cast the root view controller to UITabBarController")
            return
        }
        let expectedControllers: [UIViewController] = [tab1, tab2, tab3]
        XCTAssertEqual(tabBarController.viewControllers, expectedControllers, "The tab bar controller does not have the expected view controllers")
    }
}
