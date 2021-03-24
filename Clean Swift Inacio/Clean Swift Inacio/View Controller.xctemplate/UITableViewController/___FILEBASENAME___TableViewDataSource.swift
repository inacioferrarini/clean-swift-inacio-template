//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ___VARIABLE_sceneName___TableViewDataSourceProtocol: UITableViewDataSource {	
	var items: [___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData] { get set }
}

class ___VARIABLE_sceneName___TableViewDataSource: NSObject, ___VARIABLE_sceneName___TableViewDataSourceProtocol {

	// MARK: - Properties

	var items: [___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData] = []

	// MARK: - Overrides
	
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "___VARIABLE_sceneName___TableViewCell", for: indexPath)

		if let cell = cell as? ___VARIABLE_sceneName___TableViewCell, indexPath.row < self.items.count {			
			let rowObject = self.items[indexPath.row]
			cell.setup(with: rowObject)
		}

		return cell
	}

}
