//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import ___PROJECTNAMEASIDENTIFIER___
import UIKit

class ___VARIABLE_sceneName___CollectionViewDelegateMock: NSObject, ___VARIABLE_sceneName___CollectionViewDelegateProtocol {

	// MARK: - Properties

    var didCallCollectionViewDidSelectItemAt = false
	var collectionViewDidSelectItemAtCompletionHandler: ((_ collectionView: UICollectionView, _ indexPath: IndexPath) -> ___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData)?
    var didCallOnItemSelected = false
	var onItemSelected: ((___VARIABLE_sceneName___.UseCase.ViewModel.DisplayData) -> Void)?

	// MARK: - Overrides

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didCallCollectionViewDidSelectItemAt = true
        guard let selectedItemObject = collectionViewDidSelectItemAtCompletionHandler?(collectionView, indexPath) else { return }
        didCallOnItemSelected = true
        onItemSelected?(selectedItemObject)
	}

}
