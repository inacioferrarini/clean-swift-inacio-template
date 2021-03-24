//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ___VARIABLE_sceneName___TableViewCellProtocol {
    func setup(with value: ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData)
}

class ___VARIABLE_sceneName___TableViewCell: UITableViewCell, ___VARIABLE_sceneName___TableViewCellProtocol {

	// MARK: - Outlets

    @IBOutlet weak var label: UILabel!
	
    // MARK: - Public Methods

    func setup(with value: ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) {
        label.text = value.title
    }

}
