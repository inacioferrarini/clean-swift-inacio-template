//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___

class ___VARIABLE_sceneName___BusinessLogicMock: ___VARIABLE_sceneName___DataStore, ___VARIABLE_sceneName___BusinessLogic {

	// MARK: - Public Variables

	var didCallDoSomething = false
	var doSomethingCompletionHandler: ((_ request: ___VARIABLE_sceneName___.UseCase.Request) -> Void)? = nil

	// MARK: - Public Methods

	func doSomething(request: ___VARIABLE_sceneName___.UseCase.Request) {
		didCallDoSomething = true
		doSomethingCompletionHandler?(request)
	}

}