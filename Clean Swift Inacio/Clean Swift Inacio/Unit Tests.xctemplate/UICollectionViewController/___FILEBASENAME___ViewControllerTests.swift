//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import XCTest

class ___VARIABLE_sceneName___ViewControllerTests: XCTestCase {

	// MARK: Properties

	var sut: ___VARIABLE_sceneName___ViewController!
	var sutInteractor: ___VARIABLE_sceneName___BusinessLogicMock!
	var sutDataSource: ___VARIABLE_sceneName___CollectionViewDataSourceMock!
	var sutDelegate: ___VARIABLE_sceneName___CollectionViewDelegateMock!
	var window: UIWindow!

	// MARK: Overrides

	override func setUp() {
		super.setUp()
		window = UIWindow()
		setup___VARIABLE_sceneName___ViewController()
	}

	override func tearDown() {
		window = nil
		super.tearDown()
	}

	// MARK: Public Methods

	func setup___VARIABLE_sceneName___ViewController() {
		sutInteractor = ___VARIABLE_sceneName___BusinessLogicMock()
		sutDataSource = ___VARIABLE_sceneName___CollectionViewDataSourceMock()
		sutDelegate = ___VARIABLE_sceneName___CollectionViewDelegateMock()

		let bundle = Bundle.main
		let storyboard = UIStoryboard(name: "___VARIABLE_sceneName___", bundle: bundle)
		sut = storyboard.instantiateViewController(withIdentifier: "___VARIABLE_sceneName___ViewController") as? ___VARIABLE_sceneName___ViewController
		
		sut.interactor = sutInteractor
	}

	func loadView() {
		window.addSubview(sut.view)
		RunLoop.current.run(until: Date())
		let _ = sut.view
		sutDelegate.onItemSelected = sut.delegate?.onItemSelected
		sut.dataSource = sutDataSource
		sut.delegate = sutDelegate
	}

	// MARK: - Init

	func testInitFromNibBundleMustCallSetup() {
		// Given
		sut = ___VARIABLE_sceneName___ViewController(nibName: nil, bundle: nil)
		sut.interactor = sutInteractor

		// When
		loadView()

		// Then
		XCTAssertNotNil(sut.interactor)
		XCTAssertTrue(sutInteractor.didCallDoSomething)
	}
	
	// MARK: - viewDidLoad
	
	func testViewDidLoadMustCallDoSomething() {
		// Given

		// When
		loadView()

		// Then
		XCTAssertTrue(sutInteractor.didCallDoSomething)
	}
	
	// MARK: - display

	func testDisplayMustDisplayData() {
		// Given

		// When
		loadView()
		let dataList = [
			___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Item 1")
		]
		sut.display(viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel(displayDataList: dataList))

		// Then
		XCTAssertEqual(sutDataSource.items.count, 1)
	}
	
	// MARK: - display error
	
	func testDisplayErrorMustDisplayError() {
		// Given

		// When
		loadView()
		sut.display(error: ___VARIABLE_sceneName___WorkerError.errorKind("Error"))

		// Then
		XCTAssertTrue(sut.presentedViewController is UIAlertController)
	}

	// MARK: - Item Selection On Collection View

	func testCollectionViewDidSelectItemAtIndexPathMustCallDelegate() {
		// Given
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

		// When
		loadView()
		sutDelegate.collectionViewDidSelectItemAtCompletionHandler = { (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData in
			return ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: "Title")
		}
		sutDelegate.collectionView(collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))

		// Then
		XCTAssertTrue(sutDelegate.didCallCollectionViewDidSelectItemAt)
		XCTAssertTrue(sutDelegate.didCallOnItemSelected)
	}

}
