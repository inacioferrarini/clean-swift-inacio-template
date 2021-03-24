//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import UIKit

class ___VARIABLE_sceneName___TableViewDataSourceMock: NSObject, ___VARIABLE_sceneName___TableViewDataSourceProtocol {

	// MARK: - Properties

    var items: [___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData] = []

    var didCallNumberOfSections = false
	var numberOfSectionsCompletionHandler: ((_ tableView: UITableView) -> Int)?
    var didCallTableViewNumberOfRowsInSection = false
	var tableViewNumberOfRowsInSectionCompletionHandler: ((_ tableView: UITableView, _ section: Int) -> Int)?
    var didCallTableViewCellForRowAt = false
	var tableViewCellForRowAtCompletionHandler: ((_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell)?

	// MARK: - Overrides
	
    func numberOfSections(in tableView: UITableView) -> Int {
        didCallNumberOfSections = true
        return numberOfSectionsCompletionHandler?(tableView) ?? 0
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        didCallTableViewNumberOfRowsInSection = true
        return tableViewNumberOfRowsInSectionCompletionHandler?(tableView, section) ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        didCallTableViewCellForRowAt = true
        return tableViewCellForRowAtCompletionHandler?(tableView, indexPath) ?? UITableViewCell()
	}

}
