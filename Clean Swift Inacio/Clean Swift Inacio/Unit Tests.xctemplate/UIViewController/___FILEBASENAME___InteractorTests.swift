//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___InteractorTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___Interactor!
	var sutPresenter: ___VARIABLE_sceneName___PresentationLogicMock!
	var sutWorker: ___VARIABLE_sceneName___WorkerMock!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setup___VARIABLE_sceneName___Interactor()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___Interactor() {
		sutPresenter = ___VARIABLE_sceneName___PresentationLogicMock()
		sutWorker = ___VARIABLE_sceneName___WorkerMock()
		sut = ___VARIABLE_sceneName___Interactor(
			presenter: sutPresenter,
			worker: sutWorker
		)
	}

	// MARK: - doSomething

	func testDoSomethingSuccessMustCallPresenter() {
		// Given
		let expectation = XCTestExpectation(description: "DoSomethingCompletion")
		sutPresenter.presentResponseCompletionHandler = { (_ response: ___VARIABLE_sceneName___.UseCase.Response) in
			expectation.fulfill()
		}

		sutWorker.doWorkCompletionHandler = { (_ completion: @escaping ___VARIABLE_sceneName___WorkerDoWorkCompletionHandler) in
			let result = ___VARIABLE_sceneName___Data(name: "Response from ___VARIABLE_sceneName___Worker")
			completion(.success(result: result))
		}

		let request = ___VARIABLE_sceneName___.UseCase.Request()

		// When
		sut.doSomething(request: request)
				
		wait(for: [expectation], timeout: 1.0)
		
		// Then
	 	XCTAssertTrue(sutPresenter.didCallPresentResponse)
		XCTAssertTrue(sutWorker.didCallDoWork)
	}

	func testDoSomethingFailureMustCallPresenter() {
		// Given
		let expectation = XCTestExpectation(description: "DoSomethingCompletion")
		sutPresenter.presentErrorCompletionHandler = { (_ error: Error) in
			expectation.fulfill()
		}

		sutWorker.doWorkCompletionHandler = { (_ completion: @escaping ___VARIABLE_sceneName___WorkerDoWorkCompletionHandler) in
			completion(.failure(error: .errorKind("Mocked Error")))
		}

		let request = ___VARIABLE_sceneName___.UseCase.Request()

		// When
		sut.doSomething(request: request)

		wait(for: [expectation], timeout: 1.0)

		// Then
		XCTAssertTrue(sutPresenter.didCallPresentError)
		XCTAssertTrue(sutWorker.didCallDoWork)
	}

}
