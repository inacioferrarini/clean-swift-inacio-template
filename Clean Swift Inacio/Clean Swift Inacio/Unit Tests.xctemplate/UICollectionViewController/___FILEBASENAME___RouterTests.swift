//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___RouterTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___Router!
	var sutDataStore: ___VARIABLE_sceneName___BusinessLogicMock!
	var sutNavigationController: UINavigationControllerSpy!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setup___VARIABLE_sceneName___Router()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___Router() {
		sutDataStore = ___VARIABLE_sceneName___BusinessLogicMock()
		sutNavigationController = UINavigationControllerSpy()

		sut = ___VARIABLE_sceneName___Router(
			dataStore: sutDataStore,
			sceneNavigator: sutNavigationController
		)
	}

	// MARK: - RouteToAnotherScene
	
	func testRouteToAnotherSceneMustPresentTargetScene() {
		// Given
		let expectation = XCTestExpectation(description: "RouteToAnotherSceneCompletion")
		var targetViewControllerType: String?
		var displayAnimated: Bool?
		sutNavigationController.pushViewControllerCompletionHandler = { (_ viewController: UIViewController, _ animated: Bool) in
			targetViewControllerType = String("\(type(of: viewController))")
			displayAnimated = animated
			expectation.fulfill()
		}
		
		// When
		sut.routeToAnotherScene()
		
		wait(for: [expectation], timeout: 1.0)
		
		// Then
		XCTAssertTrue(sutNavigationController.didCallPushViewController)
		XCTAssertEqual(targetViewControllerType, "___VARIABLE_sceneName___ViewController")
		XCTAssertEqual(displayAnimated, true)
	}

}
