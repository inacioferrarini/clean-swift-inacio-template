//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ___VARIABLE_sceneName___RoutingLogic {
	func routeToAnotherScene()
}

protocol ___VARIABLE_sceneName___DataPassing {
	var dataStore: ___VARIABLE_sceneName___DataStore { get }
}

class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___DataPassing {

	// MARK: - Properties

	let dataStore: ___VARIABLE_sceneName___DataStore
	let sceneNavigator: UINavigationController?

	// MARK: - Init

	init(
	    dataStore: ___VARIABLE_sceneName___DataStore,
		sceneNavigator: UINavigationController?
	) {
		self.dataStore = dataStore
		self.sceneNavigator = sceneNavigator
	}

}

extension ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RoutingLogic {
	
	func routeToAnotherScene() {
		let storyboard = UIStoryboard(name: "___VARIABLE_sceneName___", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "___VARIABLE_sceneName___ViewController")

		// sceneViewController setup

		DispatchQueue.main.async { [weak self] in
			self?.sceneNavigator?.pushViewController(
				viewController,
				animated: true
			)
		}
	}

}
