//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___

class ___VARIABLE_sceneName___PresentationLogicMock: ___VARIABLE_sceneName___PresentationLogic {

	// MARK: - Public Variables

	var didCallPresentResponse = false
	var presentResponseCompletionHandler: ((_ response: ___VARIABLE_sceneName___.UseCase.Response) -> Void)? = nil
	var didCallPresentError = false
	var presentErrorCompletionHandler: ((_ error: Error) -> Void)? = nil

	// MARK: - Public Methods

	func present(response: ___VARIABLE_sceneName___.UseCase.Response) {
		didCallPresentResponse = true
		presentResponseCompletionHandler?(response)
	}

	func present(error: Error) {
		didCallPresentError = true
		presentErrorCompletionHandler?(error)
	}

}