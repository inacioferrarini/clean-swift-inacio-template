//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Protocols

protocol ___VARIABLE_sceneName___PresentationLogic {
	func present(response: ___VARIABLE_sceneName___.UseCase.Response)
	func present(error: Error)
}

class ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___PresentationLogic {

	// MARK: - Properties

	weak var viewController: ___VARIABLE_sceneName___DisplayLogic?

	// MARK: - Init

	init(viewController: ___VARIABLE_sceneName___DisplayLogic?) {
		self.viewController = viewController
	}

	// MARK: - Public Methods

	func present(response: ___VARIABLE_sceneName___.UseCase.Response) {
		var responseData: [___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData] = []
		for data in response.dataList {
			let displayData = ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData(title: data.name)
			responseData.append(displayData)
		}
		let viewModel = ___VARIABLE_sceneName___.UseCase.ViewModel(displayDataList: responseData)
		DispatchQueue.main.async { [weak self] in
			self?.viewController?.display(viewModel: viewModel)
		}
	}

	func present(error: Error) {
		DispatchQueue.main.async { [weak self] in
			self?.viewController?.display(error: error)
		}
	}

}
