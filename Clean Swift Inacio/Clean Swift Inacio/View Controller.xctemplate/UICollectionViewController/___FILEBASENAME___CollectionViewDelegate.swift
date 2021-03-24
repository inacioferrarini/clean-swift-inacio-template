//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ___VARIABLE_sceneName___CollectionViewDelegateProtocol: UICollectionViewDelegate {
	var onItemSelected: ((___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) -> Void)? { get set }
}

class ___VARIABLE_sceneName___CollectionViewDelegate: NSObject, ___VARIABLE_sceneName___CollectionViewDelegateProtocol {

	// MARK: - Properties
	
	let dataSource: ___VARIABLE_sceneName___CollectionViewDataSourceProtocol
	var onItemSelected: ((___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) -> Void)?

	// MARK: - Init

	init(dataSource: ___VARIABLE_sceneName___CollectionViewDataSourceProtocol) {
		self.dataSource = dataSource
	}

	// MARK: - Overrides

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard indexPath.item < self.dataSource.items.count else { return }
		let selectedItemObject = self.dataSource.items[indexPath.item]
		onItemSelected?(selectedItemObject)
	}

}
