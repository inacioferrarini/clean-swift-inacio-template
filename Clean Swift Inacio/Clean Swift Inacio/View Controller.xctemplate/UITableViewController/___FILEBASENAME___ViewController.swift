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
	var delegate: ___VARIABLE_sceneName___TableViewDelegateProtocol?
	var dataSource: ___VARIABLE_sceneName___TableViewDataSourceProtocol?

	// MARK: - Outlets

	@IBOutlet weak var tableView: UITableView!

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
		setupTableView()
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

	private func setupTableView() {
		guard let tableView = tableView else { return }

		let bundle = Bundle(for: type(of: self))
		let cellType = String(describing: ___VARIABLE_sceneName___TableViewCell.self)
        tableView.register(UINib(nibName: cellType, bundle: bundle), forCellReuseIdentifier: cellType)

		let dataSource = ___VARIABLE_sceneName___TableViewDataSource()
		let delegate = ___VARIABLE_sceneName___TableViewDelegate(dataSource: dataSource)

		delegate.onRowSelected = { (displayData: ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) in
			debugPrint("Item Selected: \(displayData.title)")
		}

		self.dataSource = dataSource
		tableView.dataSource = dataSource

		self.delegate = delegate
        tableView.delegate = delegate
	}

}

extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___DisplayLogic {

	func doSomething() {
		let request = ___VARIABLE_sceneName___.UseCase.Request()
		interactor?.doSomething(request: request)
	}

	func display(viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel) {
		dataSource?.items = viewModel.displayDataList
		tableView.reloadData()
	}

	func display(error: Error)	{
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