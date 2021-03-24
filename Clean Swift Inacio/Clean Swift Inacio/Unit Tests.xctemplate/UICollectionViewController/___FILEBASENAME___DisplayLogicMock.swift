//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___

class ___VARIABLE_sceneName___DisplayLogicMock: ___VARIABLE_sceneName___DisplayLogic {

	// MARK: - Public Variables

	var didCallDisplayUseCase = false
	var displayUseCaseCompletionHandler: ((_ viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel) -> Void)? = nil
	var didCallDisplayError = false
	var displayErrorCompletionHandler: ((_ error: Error) -> Void)? = nil

	// MARK: - Public Methods

	func display(viewModel: ___VARIABLE_sceneName___.UseCase.ViewModel) {
		didCallDisplayUseCase = true
		displayUseCaseCompletionHandler?(viewModel)
	}

	func display(error: Error) {
		didCallDisplayError = true
		displayErrorCompletionHandler?(error)
	}

}