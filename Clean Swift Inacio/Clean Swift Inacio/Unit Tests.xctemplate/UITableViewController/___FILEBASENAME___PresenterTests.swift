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
	var sutDisplayLogic: ___VARIABLE_sceneName___DisplayLogicMock!

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
		sutDisplayLogic = ___VARIABLE_sceneName___DisplayLogicMock()
		sut = ___VARIABLE_sceneName___Presenter(viewController: sutDisplayLogic)
	}

	func getDataListFromFixture() -> [___VARIABLE_sceneName___Data] {
		var messages: [___VARIABLE_sceneName___Data]?

		let bundle = Bundle(for: type(of: self))
		if  let resourceUrl = bundle.url(forResource: "___VARIABLE_sceneName___PresenterTestsFixture", withExtension: "json"), let data = try? Data(contentsOf: resourceUrl) {
			let decoder = JSONDecoder()
			messages = try? decoder.decode([___VARIABLE_sceneName___Data].self, from: data)
		}
		return messages ?? []
	}

	// MARK: - present

	func testPresentMustPresentData() {
		// Given
		let expectation = XCTestExpectation(description: "PresentCompletion")
		var sutViewModel: ___VARIABLE_sceneName___.UseCase.ViewModel?
		sutDisplayLogic.displayUseCaseCompletionHandler = { (_ viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel) in
			sutViewModel = viewModel
			expectation.fulfill()
		}

		let dataList = getDataListFromFixture()
		let response = ___VARIABLE_sceneName___.UseCase.Response(dataList: dataList)

		// When
		sut.present(response: response)
		
		wait(for: [expectation], timeout: 1.0)
		
		// Then
		XCTAssertTrue(sutDisplayLogic.didCallDisplayUseCase)
		XCTAssertNotNil(sutViewModel)
		XCTAssertEqual(sutViewModel?.displayDataList.count, 3)
	}

	// MARK: - present

	func testPresentMustPresentError() {
		// Given
		let expectation = XCTestExpectation(description: "PresentCompletion")
		sutDisplayLogic.displayErrorCompletionHandler = { _ in
			expectation.fulfill()
		}

		let error = ___VARIABLE_sceneName___WorkerError.errorKind("")

		// When
		sut.present(error: error)
		
		wait(for: [expectation], timeout: 1.0)
		
		// Then
		XCTAssertTrue(sutDisplayLogic.didCallDisplayError)
	}

}