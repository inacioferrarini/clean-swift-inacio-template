//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___WorkerTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___Worker!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setup___VARIABLE_sceneName___Worker()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___Worker() {
		sut = ___VARIABLE_sceneName___Worker()
	}

	func message(from error: ___VARIABLE_sceneName___WorkerError) -> String? {
		switch error {
		case .errorKind(let message):
			return message
		}
	}

	// MARK: - doWork

	func testDoWorkSuccessMustReturnData() {
		// Given
		let expectation = XCTestExpectation(description: "DoWorkCompletion")

		// When
		var value: ___VARIABLE_sceneName___Data? = nil

		sut.doWork(completion: { (completion: ___VARIABLE_sceneName___WorkerResult<___VARIABLE_sceneName___Data>) in
			switch completion {
			case .success(let returnedValue):
				value = returnedValue
				expectation.fulfill()
			default:
				XCTFail(".failure was not expected to be called")
			}
		})

		wait(for: [expectation], timeout: 1.0)

		// Then
		XCTAssertNotNil(value)
	}

	// func testDoWorkFailureMustReturnError() {
	// 	// Given
	// 	let expectation = XCTestExpectation(description: "DoWorkCompletion")

	// 	// When
	// 	var error: Error?
	// 	var errorMessage: String?

	// 	sut.doWork(completion: { [weak self] (completion: ___VARIABLE_sceneName___WorkerResult<___VARIABLE_sceneName___Data>) in
	// 		switch completion {
	// 			case .failure(let returnedError):
	// 				errorMessage = self?.message(from: returnedError)
	// 				error = returnedError
	// 				expectation.fulfill()
	// 			default:
	// 				XCTFail(".success should not be called in this case")
	// 		}
	// 	})

	// 	wait(for: [expectation], timeout: 1.0)

	// 	// Then
	// 	XCTAssertNotNil(error)
	// 	XCTAssertNotNil(errorMessage)
	// 	//XCTAssertEqual(errorMessage ?? "", "Expected Error Message")
	// }

}
