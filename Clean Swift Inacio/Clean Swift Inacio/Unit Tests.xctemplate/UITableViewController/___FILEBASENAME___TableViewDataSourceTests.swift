//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___TableViewDataSourceTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___TableViewDataSource!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setup___VARIABLE_sceneName___TableViewDataSource()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___TableViewDataSource() {
		sut = ___VARIABLE_sceneName___TableViewDataSource()
	}

	// MARK: - Number Of Sections
	
	func testNumberOfSectionsMustReturnOne() {
		// Given
		let tableView = UITableView()
		
		// When
		let sections = sut?.numberOfSections(in: tableView)
		
		// Then
		XCTAssertEqual(sections, 1)
	}

	// // MARK: - Number Of Rows In Section
	
	func testNumberOfRowsInSectionWithoutDataMustReturnZero() {
		// Given
		let tableView = UITableView()
		
		// When
		let numberOfRows = sut?.tableView(tableView, numberOfRowsInSection: 0)
		
		// Then
		XCTAssertEqual(numberOfRows, 0)
	}
    
	func testNumberOfRowsInSectionWithDataMustAmountOfData() {
		// Given
		let tableView = UITableView()
		
		sut?.items = [
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 1"),
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 2")
		]
		
		// When
		let numberOfRows = sut?.tableView(tableView, numberOfRowsInSection: 0)
		
		// Then
		XCTAssertEqual(numberOfRows, 2)
	}

	// MARK: - Cell For Row At

	func testTableViewCellForRowAtWithoutDataMustReturnCell() {
		//Given
		let tableView = UITableView(frame: .zero)
		
		let bundle = Bundle(for: ___VARIABLE_sceneName___TableViewCell.self)
		let cellType = String(describing: ___VARIABLE_sceneName___TableViewCell.self)
		tableView.register(UINib(nibName: cellType, bundle: bundle), forCellReuseIdentifier: cellType)
		tableView.dataSource = sut
		tableView.reloadData()
		
		//When
		let cell = sut?.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ___VARIABLE_sceneName___TableViewCell
		
		//Then
		XCTAssertNotNil(cell)
		XCTAssertEqual(cell?.label.text, "___VARIABLE_sceneName___TableViewCell")
	}
	
	func testTableViewCellForRowWithDataAtMustReturnCell() {
		//Given
		let tableView = UITableView(frame: .zero)
		
		let bundle = Bundle(for: ___VARIABLE_sceneName___TableViewCell.self)
		let cellType = String(describing: ___VARIABLE_sceneName___TableViewCell.self)
		tableView.register(UINib(nibName: cellType, bundle: bundle), forCellReuseIdentifier: cellType)
		tableView.dataSource = sut
		tableView.reloadData()
		
		sut?.items = [
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 1"),
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 2")
		]
		
		//When
		let cell = sut?.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ___VARIABLE_sceneName___TableViewCell
		
		//Then
		XCTAssertNotNil(cell)
		XCTAssertEqual(cell?.label.text, "Item 1")
	}

}