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

		let bundle = Bundle.main
		let storyboard = UIStoryboard(name: "___VARIABLE_sceneName___", bundle: bundle)
		sut = storyboard.instantiateViewController(withIdentifier: "___VARIABLE_sceneName___ViewController") as? ___VARIABLE_sceneName___ViewController
		
		sut.interactor = sutInteractor
	}

	func loadView() {
		window.addSubview(sut.view)
		RunLoop.current.run(until: Date())
		let _ = sut.view
	}

	// MARK: - Init

	func testInitFromNibBundleMustCallSetup() {
		// Given
		sut = ___VARIABLE_sceneName___ViewController(nibName: nil, bundle: nil)
		
		// When
		loadView()
		
		// Then
		XCTAssertNotNil(sut.interactor)
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
		sut.display(viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel(name: "Name 01"))
		
		// Then
		XCTAssertEqual(sut.nameLabel.text, "Name 01")
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

}
