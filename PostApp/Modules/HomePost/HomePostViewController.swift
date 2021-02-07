//
//  HomePostViewController.swift
//  PostApp
//
//  Created by Carlos Parada on 6/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Domain
import UIKit

struct HomePostViewModel {
    var postList: [PostTableViewCell] = []
}

final class HomePostViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    private var viewModel = HomePostViewModel()
    var presenter: HomePostPresenterContract?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
    }
}

private extension HomePostViewController {
    
}
