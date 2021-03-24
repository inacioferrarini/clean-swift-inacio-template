//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___CollectionViewDelegateTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___CollectionViewDelegate!
    var sutDataSource: ___VARIABLE_sceneName___CollectionViewDataSourceMock!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setup___VARIABLE_sceneName___CollectionViewDelegate()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___CollectionViewDelegate() {
		sutDataSource = ___VARIABLE_sceneName___CollectionViewDataSourceMock()
		sut = ___VARIABLE_sceneName___CollectionViewDelegate(
			dataSource: sutDataSource
		)
	}

    // MARK: Did Select Item At Index Path

    func testDidSelectItemAtIndexPathForNonExistingItemMustNotCallOnItemSelected() {
		// Given
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		let delayExpectation = XCTestExpectation()
		delayExpectation.isInverted = true
		var onItemSelectedCalled = false
		sut.onItemSelected = { (data: ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) in
			onItemSelectedCalled = true
			delayExpectation.fulfill()
		}
		
		// When
		sut.collectionView(collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
		
		wait(for: [delayExpectation], timeout: 0.4)
		
		// Then
		XCTAssertFalse(onItemSelectedCalled)
    }

    func testDidSelectItemAtIndexPathForExistingItemMustCallOnItemSelected() {
		// Given
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		let delayExpectation = XCTestExpectation()
		var onItemSelectedCalled = false
		sut.onItemSelected = { (data: ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) in
			onItemSelectedCalled = true
			delayExpectation.fulfill()
		}
		
		sutDataSource.items = [
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 1"),
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 2")
		]
		
		// When
		sut.collectionView(collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
		
		wait(for: [delayExpectation], timeout: 0.4)
		
		// Then
		XCTAssertTrue(onItemSelectedCalled)
    }

}
