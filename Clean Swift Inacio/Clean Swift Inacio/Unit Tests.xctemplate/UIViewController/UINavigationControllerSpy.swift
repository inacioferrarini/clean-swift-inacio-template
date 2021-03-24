//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import UIKit

class UINavigationControllerSpy: UINavigationController {

	// MARK: - Public Variables

	var didCallPopViewController = false
	var popViewControllerCompletionHandler: ((_ animated: Bool) -> UIViewController?)? = nil
	var didCallPushViewController = false
	var pushViewControllerCompletionHandler: ((_ viewController: UIViewController, _ animated: Bool) -> Void)? = nil
	
	// MARK: - Public Methods

	override func popViewController(animated: Bool) -> UIViewController? {
		didCallPopViewController = true
		var viewController: UIViewController?
		if let returnedViewController = popViewControllerCompletionHandler?(animated) {
			viewController = returnedViewController
		}
		return viewController
	}

	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		didCallPushViewController = true
		pushViewControllerCompletionHandler?(viewController, animated)
	}

}