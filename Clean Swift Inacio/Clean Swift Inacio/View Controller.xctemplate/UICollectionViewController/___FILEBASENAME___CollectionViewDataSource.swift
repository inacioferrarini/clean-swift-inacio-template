//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Protocols

protocol ___VARIABLE_sceneName___CollectionViewDataSourceProtocol: UICollectionViewDataSource {	
	var items: [___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData] { get set }
}

class ___VARIABLE_sceneName___CollectionViewDataSource: NSObject, ___VARIABLE_sceneName___CollectionViewDataSourceProtocol {

	// MARK: - Properties

	var items: [___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData] = []

	// MARK: - Overrides
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "___VARIABLE_sceneName___CollectionViewCell", for: indexPath)

		if let cell = cell as? ___VARIABLE_sceneName___CollectionViewCell, indexPath.row < self.items.count {
			let itemObject = self.items[indexPath.item]
			cell.setup(with: itemObject)
		}

		return cell
	}
	
}
