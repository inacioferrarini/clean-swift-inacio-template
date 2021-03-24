//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___TableViewCellTests: XCTestCase {

	// MARK: - Overrides

	override func setUp() {
		super.setUp()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: - Nib Tests
	
	func test___VARIABLE_sceneName___TableViewCellNibContainsAViewOfExpectedType() {
		// Given
		let bundle = Bundle(for: ___VARIABLE_sceneName___TableViewCell.self)
		
		// When
		let view = bundle.loadNibNamed("___VARIABLE_sceneName___TableViewCell", owner: nil)?.first as? UIView
		
		// Then
		XCTAssertNotNil(view, "___VARIABLE_sceneName___TableViewCell nib did not contain a UIView")
		XCTAssertTrue(view is ___VARIABLE_sceneName___TableViewCell, "view  is not ___VARIABLE_sceneName___TableViewCell")
	}
	
	// MARK: - setup
	
	func testSetupMustSetUIValues() {
		// Given
		let bundle = Bundle(for: ___VARIABLE_sceneName___TableViewCell.self)
		let displayData = ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Display Data 01")

		// When
		let cell = bundle.loadNibNamed("___VARIABLE_sceneName___TableViewCell", owner: nil)?.first as? ___VARIABLE_sceneName___TableViewCell
		cell?.setup(with: displayData)
		
		// Then
		XCTAssertEqual(cell?.label.text, "Display Data 01")
	}

}
