//
//  HomePostViewBuilder.swift
//  PostApp
//
//  Created by Carlos Parada on 6/02/21.
//

import Foundation
import Injector
import UIKit

final class HomePostViewBuilder {
    /// Build the viewcontroller link / configure injector and viewcontroller
    /// - Returns: ViewController with power
    func build() -> HomePostViewController {
        let storyboard = UIStoryboard(name: "HomePost", bundle: nil)
        guard let pstListVC = storyboard.instantiateInitialViewController() as? HomePostViewController else {
            fatalError("Could not allocate HomePostViewBuilder")
        }
        let postListUseCase = Injector.provideGetPostListUsecase()
        pstListVC.presenter = HomePostPresenter(view: pstListVC,
                                                getPostListUseCase: postListUseCase)
        return pstListVC
    }
}
