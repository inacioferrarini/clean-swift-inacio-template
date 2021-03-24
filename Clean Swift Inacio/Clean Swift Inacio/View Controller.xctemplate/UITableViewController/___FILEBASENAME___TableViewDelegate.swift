//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ___VARIABLE_sceneName___TableViewDelegateProtocol: UITableViewDelegate {
	var onRowSelected: ((___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) -> Void)? { get set }
}

class ___VARIABLE_sceneName___TableViewDelegate: NSObject, ___VARIABLE_sceneName___TableViewDelegateProtocol {

	// MARK: - Properties
	
	let dataSource: ___VARIABLE_sceneName___TableViewDataSourceProtocol
	var onRowSelected: ((___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) -> Void)?

	// MARK: - Init

	init(dataSource: ___VARIABLE_sceneName___TableViewDataSourceProtocol) {
		self.dataSource = dataSource
	}
	
	// MARK: - Overrides

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard indexPath.row < self.dataSource.items.count else { return }
		let selectedRowObject = self.dataSource.items[indexPath.row]
		onRowSelected?(selectedRowObject)
	}

}
