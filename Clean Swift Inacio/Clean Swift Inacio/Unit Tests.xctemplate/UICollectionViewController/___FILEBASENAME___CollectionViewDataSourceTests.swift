//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___CollectionViewDataSourceTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___CollectionViewDataSource!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		setup___VARIABLE_sceneName___CollectionViewDataSource()
	}

	override func tearDown() {
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___CollectionViewDataSource() {
		sut = ___VARIABLE_sceneName___CollectionViewDataSource()
	}

	// MARK: - Number Of Items In Section
	
	func testNumberOfItemsInSectionWithoutDataMustReturnZero() {
		// Given
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		
		// When
		let numberOfItems = sut?.collectionView(collectionView, numberOfItemsInSection: 0)
		
		// Then
		XCTAssertEqual(numberOfItems, 0)
	}
    
	func testNumberOfItemsInSectionWithDataMustAmountOfData() {
		// Given
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		
		sut?.items = [
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 1"),
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 2")
		]
		
		// When
		let numberOfItems = sut?.collectionView(collectionView, numberOfItemsInSection: 0)
		
		// Then
		XCTAssertEqual(numberOfItems, 2)
	}

	// MARK: - Cell For Item At

	func testCollectionViewCellForItemAtWithoutDataMustReturnCell() {
		//Given
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		
		let bundle = Bundle(for: ___VARIABLE_sceneName___CollectionViewCell.self)
		let cellType = String(describing: ___VARIABLE_sceneName___CollectionViewCell.self)
		collectionView.register(UINib(nibName: cellType, bundle: bundle), forCellWithReuseIdentifier: cellType)
		collectionView.dataSource = sut
		collectionView.reloadData()
		
		//When
		let cell = sut?.collectionView(collectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? ___VARIABLE_sceneName___CollectionViewCell
		
		//Then
		XCTAssertNotNil(cell)
		XCTAssertEqual(cell?.label.text, "___VARIABLE_sceneName___CollectionViewCell")
	}
	
	func testCollectionViewCellForItemWithDataAtMustReturnCell() {
		//Given
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		
		let bundle = Bundle(for: ___VARIABLE_sceneName___CollectionViewCell.self)
		let cellType = String(describing: ___VARIABLE_sceneName___CollectionViewCell.self)
		collectionView.register(UINib(nibName: cellType, bundle: bundle), forCellWithReuseIdentifier: cellType)
		collectionView.dataSource = sut
		collectionView.reloadData()
		
		sut?.items = [
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 1"),
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 2")
		]
		
		//When
		let cell = sut?.collectionView(collectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? ___VARIABLE_sceneName___CollectionViewCell
		
		//Then
		XCTAssertNotNil(cell)
		XCTAssertEqual(cell?.label.text, "Item 1")
	}

}