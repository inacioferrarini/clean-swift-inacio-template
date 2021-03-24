//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

// MARK: - Protocols

protocol ___VARIABLE_sceneName___WorkerProtocol {
	func doWork(completion: @escaping ___VARIABLE_sceneName___WorkerDoWorkCompletionHandler)
}

// MARK: - Typealiases

typealias ___VARIABLE_sceneName___WorkerDoWorkCompletionHandler = (___VARIABLE_sceneName___WorkerResult<___VARIABLE_sceneName___Data>) -> Void

// MARK: - Enums

enum ___VARIABLE_sceneName___WorkerResult<U> {
    case success(result: U)
    case failure(error: ___VARIABLE_sceneName___WorkerError)
}

// MARK: - Errors

enum ___VARIABLE_sceneName___WorkerError: Equatable, Error {
	case errorKind(String)
}

class ___VARIABLE_sceneName___Worker: ___VARIABLE_sceneName___WorkerProtocol {

	// MARK: - Public Methods

	func doWork(completion: @escaping ___VARIABLE_sceneName___WorkerDoWorkCompletionHandler) {
		
		// succes?
		let result = ___VARIABLE_sceneName___Data(name: "Response from ___VARIABLE_sceneName___Worker")
		completion(.success(result: result))

		// failure?
		// completion(.failure(error: .errorKind("")))
	}

}
