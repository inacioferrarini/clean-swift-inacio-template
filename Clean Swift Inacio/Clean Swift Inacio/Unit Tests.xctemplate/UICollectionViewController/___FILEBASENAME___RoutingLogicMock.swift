//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import Foundation

class ___VARIABLE_sceneName___RoutingLogicMock: NSObject, ___VARIABLE_sceneName___RoutingLogic, ___VARIABLE_sceneName___DataPassing {
	
	var dataStore: ___VARIABLE_sceneName___DataStore

	// MARK: - Init

	init(dataStore: ___VARIABLE_sceneName___DataStore) {
		self.dataStore = dataStore
	}

	// MARK: - Public Variables

	var didCallRouteToAnotherScene = false
	var routeToAnotherSceneCompletionHandler: (() -> Void)? = nil

	// MARK: - Public Methods
	
	func routeToAnotherScene() {
		didCallRouteToAnotherScene = true
		routeToAnotherSceneCompletionHandler?()
	}
		
}
