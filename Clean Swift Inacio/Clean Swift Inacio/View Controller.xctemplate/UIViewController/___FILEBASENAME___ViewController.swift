//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ___VARIABLE_sceneName___DisplayLogic: class {
	func display(viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel)
	func display(error: Error)
}

class ___VARIABLE_sceneName___ViewController: UIViewController {

	// MARK: - Properties

	var interactor: ___VARIABLE_sceneName___BusinessLogic?
	var router: (___VARIABLE_sceneName___RoutingLogic & ___VARIABLE_sceneName___DataPassing)?

	// MARK: - Outlets

	@IBOutlet weak var nameLabel: UILabel!

	// MARK: - Init

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	// MARK: - Overrides

	override func viewDidLoad() {
		super.viewDidLoad()
		doSomething()
	}

 	// MARK: - Actions
 
    // @IBAction func ...

	// MARK: - Private Methods

	private func setup() {
		let viewController = self
		let sceneNavigator = viewController.navigationController
		let presenter = ___VARIABLE_sceneName___Presenter(viewController: viewController)
		let interactor = ___VARIABLE_sceneName___Interactor(presenter: presenter)
		let router = ___VARIABLE_sceneName___Router(dataStore: interactor, sceneNavigator: sceneNavigator)
		viewController.interactor = interactor
		viewController.router = router
	}

}

extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___DisplayLogic {

	func doSomething() {
		let request = ___VARIABLE_sceneName___.UseCase.Request()
		interactor?.doSomething(request: request)
	}

	func display(viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel) {
		nameLabel?.text = viewModel.name
	}

	func display(error: Error) {
		let alert = UIAlertController(
			title: title,
			message: String(describing: error),
			preferredStyle: .alert
		)
		let okAction = UIAlertAction(
			title: "OK",
			style: .default
		)
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}

}
