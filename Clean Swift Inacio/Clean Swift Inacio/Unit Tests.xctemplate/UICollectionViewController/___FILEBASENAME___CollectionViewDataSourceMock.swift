//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import UIKit

class ___VARIABLE_sceneName___CollectionViewDataSourceMock: NSObject, ___VARIABLE_sceneName___CollectionViewDataSourceProtocol {

	// MARK: - Properties

    var items: [___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData] = []

    var didCallCollectionViewNumberOfItemsInSection = false
	var collectionViewNumberOfItemsInSectionCompletionHandler: ((_ collectionView: UICollectionView, _ section: Int) -> Int)?
    var didCallCollectionViewCellForItemAt = false
	var collectionViewCellForItemAtCompletionHandler: ((_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell)?

	// MARK: - Overrides
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        didCallCollectionViewNumberOfItemsInSection = true
		return collectionViewNumberOfItemsInSectionCompletionHandler?(collectionView, section) ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        didCallCollectionViewCellForItemAt = true
        return collectionViewCellForItemAtCompletionHandler?(collectionView, indexPath) ?? UICollectionViewCell()
	}

}
