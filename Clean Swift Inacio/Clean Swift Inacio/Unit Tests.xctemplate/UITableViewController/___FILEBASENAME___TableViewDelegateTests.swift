//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___TableViewDelegateTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___TableViewDelegate!
    var sutDataSource: ___VARIABLE_sceneName___TableViewDataSourceMock!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setup___VARIABLE_sceneName___TableViewDelegate()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___TableViewDelegate() {
		sutDataSource = ___VARIABLE_sceneName___TableViewDataSourceMock()
		sut = ___VARIABLE_sceneName___TableViewDelegate(
			dataSource: sutDataSource
		)
	}

    // MARK: Did Select Row At Index Path

    func testDidSelectRowAtIndexPathForNonExistingItemMustNotCallOnRowSelected() {
		// Given
		let delayExpectation = XCTestExpectation()
		delayExpectation.isInverted = true
		var onRowSelectedCalled = false
		sut.onRowSelected = { (data: ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) in
			onRowSelectedCalled = true
			delayExpectation.fulfill()
		}
		
		// When
		sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
		
		wait(for: [delayExpectation], timeout: 0.4)
		
		// Then
		XCTAssertFalse(onRowSelectedCalled)
    }

    func testDidSelectRowAtIndexPathForExistingItemMustCallOnRowSelected() {
		// Given
		let delayExpectation = XCTestExpectation()
		var onRowSelectedCalled = false
		sut.onRowSelected = { (data: ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) in
			onRowSelectedCalled = true
			delayExpectation.fulfill()
		}
		
		sutDataSource.items = [
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 1"),
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 2")
		]
		
		// When
		sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
		
		wait(for: [delayExpectation], timeout: 0.4)
		
		// Then
		XCTAssertTrue(onRowSelectedCalled)
    }

}
