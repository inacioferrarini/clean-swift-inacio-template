//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___CollectionViewCellTests: XCTestCase {

	// MARK: - Overrides

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: - Nib Tests
	
	func test___VARIABLE_sceneName___CollectionViewCellNibContainsAViewOfExpectedType() {
		// Given
		let bundle = Bundle(for: ___VARIABLE_sceneName___CollectionViewCell.self)
		
		// When
		let view = bundle.loadNibNamed("___VARIABLE_sceneName___CollectionViewCell", owner: nil)?.first as? UIView
		
		// Then
		XCTAssertNotNil(view, "___VARIABLE_sceneName___CollectionViewCell nib did not contain a UIView")
		XCTAssertTrue(view is ___VARIABLE_sceneName___CollectionViewCell, "view is not ___VARIABLE_sceneName___CollectionViewCell")
	}

	// MARK: - setup
	
	func testSetupMustSetUIValues() {
		// Given
		let bundle = Bundle(for: ___VARIABLE_sceneName___CollectionViewCell.self)
		let displayData = ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Display Data 01")

		// When
		let cell = bundle.loadNibNamed("___VARIABLE_sceneName___CollectionViewCell", owner: nil)?.first as? ___VARIABLE_sceneName___CollectionViewCell
		cell?.setup(with: displayData)
		
		// Then
		XCTAssertEqual(cell?.label.text, "Display Data 01")
	}

}
