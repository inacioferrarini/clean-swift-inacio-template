//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___

class ___VARIABLE_sceneName___WorkerMock: ___VARIABLE_sceneName___WorkerProtocol {

	// MARK: - Public Variables

	var didCallDoWork = false
	var doWorkCompletionHandler: ((_ completion: @escaping ___VARIABLE_sceneName___WorkerDoWorkCompletionHandler) -> Void)?

	// MARK: - Public Methods

	func doWork(completion: @escaping ___VARIABLE_sceneName___WorkerDoWorkCompletionHandler) {
		didCallDoWork = true
		doWorkCompletionHandler?(completion)
	}

}