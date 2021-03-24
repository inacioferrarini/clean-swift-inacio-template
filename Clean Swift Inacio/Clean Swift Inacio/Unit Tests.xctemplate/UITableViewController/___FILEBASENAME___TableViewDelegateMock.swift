//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import UIKit

class ___VARIABLE_sceneName___TableViewDelegateMock: NSObject, ___VARIABLE_sceneName___TableViewDelegateProtocol {

	// MARK: - Properties

    var didCallTableViewDidSelectRowAt = false
	var tableViewDidSelectRowAtCompletionHandler: ((_ tableView: UITableView, _ indexPath: IndexPath) -> ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData)?
    var didCallOnRowSelected = false
	var onRowSelected: ((___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) -> Void)?

	// MARK: - Overrides

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didCallTableViewDidSelectRowAt = true
        guard let selectedRowObject = tableViewDidSelectRowAtCompletionHandler?(tableView, indexPath) else { return }
        didCallOnRowSelected = true
        onRowSelected?(selectedRowObject)
	}

}
