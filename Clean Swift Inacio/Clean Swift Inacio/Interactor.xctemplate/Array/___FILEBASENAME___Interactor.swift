//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: - Protocols

protocol ___VARIABLE_sceneName___BusinessLogic {
	func doSomething(request: ___VARIABLE_sceneName___.UseCase.Request)
}

protocol ___VARIABLE_sceneName___DataStore {
	//var property: String { get set }
}

class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___DataStore {

	// MARK: - Properties

	let presenter: ___VARIABLE_sceneName___PresentationLogic
	let worker: ___VARIABLE_sceneName___WorkerProtocol
	//var property: String = ""

	// MARK: - Init

	init(
		presenter: ___VARIABLE_sceneName___PresentationLogic,
		worker: ___VARIABLE_sceneName___WorkerProtocol = ___VARIABLE_sceneName___Worker()
	) {
		self.presenter = presenter
		self.worker = worker
	}

}

extension ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic {

	func doSomething(request: ___VARIABLE_sceneName___.UseCase.Request) {
		DispatchQueue.global().async { [weak self] in
			self?.worker.doWork(completion: { [weak self] (result: ___VARIABLE_sceneName___WorkerResult<[___VARIABLE_sceneName___Data]>) in
				switch result {
				case .success(let values):
					let response = ___VARIABLE_sceneName___.UseCase.Response(dataList: values)
					self?.presenter.present(response: response)
				case .failure(let error):
					self?.presenter.present(error: error)
				}
			})
		}
	}

}
