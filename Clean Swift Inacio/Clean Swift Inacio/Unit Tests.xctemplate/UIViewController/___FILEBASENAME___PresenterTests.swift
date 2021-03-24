//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___PresenterTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___Presenter!
	var sutViewController: ___VARIABLE_sceneName___DisplayLogicMock!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setup___VARIABLE_sceneName___Presenter()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___Presenter() {
		sutViewController = ___VARIABLE_sceneName___DisplayLogicMock()
		sut = ___VARIABLE_sceneName___Presenter(
			viewController: sutViewController
		)
	}

	// MARK: - Present Response

	func testPresentResponseMustPresentData() {
		// Given
		let expectation = XCTestExpectation(description: "PresentResponseCompletion")

		var sutViewModel: ___VARIABLE_sceneName___.UseCase.ViewModel?
		sutViewController.displayViewModelCompletionHandler = { (_ viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel) in
			sutViewModel = viewModel
			expectation.fulfill()
		}

		let data = ___VARIABLE_sceneName___Data(name: "name")
		let response = ___VARIABLE_sceneName___.UseCase.Response(value: data)

		// When
		sut.present(response: response)
		
		wait(for: [expectation], timeout: 1.0)
		
		// Then
		XCTAssertTrue(sutViewController.didCallDisplayViewModel)
		XCTAssertNotNil(sutViewModel)
	}

	// MARK: - Present Error

	func testPresentErrorMustPresentError() {
		// Given
		let expectation = XCTestExpectation(description: "PresentErrorCompletion")

		sutViewController.displayErrorCompletionHandler = { _ in
			expectation.fulfill()
		}

		let error = ___VARIABLE_sceneName___WorkerError.errorKind("")

		// When
		sut.present(error: error)
		
		wait(for: [expectation], timeout: 1.0)
		
		// Then
		XCTAssertTrue(sutViewController.didCallDisplayError)
	}

}