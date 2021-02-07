//
//  HomePostViewController.swift
//  PostApp
//
//  Created by Carlos Parada on 6/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Domain
import UIKit

struct HomePostViewModel {
    var postList: [PostCellViewModel] = []
}

final class HomePostViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!

    private var viewModel = HomePostViewModel()
    var presenter: HomePostPresenterContract?
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
        setupTable()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
}

private extension HomePostViewController {
    func setupTable() {
        let postCell = UINib(nibName: "PostTableViewCell", bundle: nil)
        tableView.register(postCell, forCellReuseIdentifier: "PostTableViewCell")
        let post2Cell = UINib(nibName: "PostDoubleCell", bundle: nil)
        tableView.register(post2Cell, forCellReuseIdentifier: "PostDoubleCell")
        let postMultiCell = UINib(nibName: "PostMultipleCell", bundle: nil)
        tableView.register(postMultiCell, forCellReuseIdentifier: "PostMultipleCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - PostListViewContract
extension HomePostViewController: HomePostViewContract {
    func renderPostList(_ models: [PostCellViewModel]) {
        viewModel.postList = models
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomePostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.postList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.postList[indexPath.row].fill(on: tableView)
    }
}

// MARK: - UITableViewDataSource
extension HomePostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.postList[indexPath.row].heightRow(on: tableView)
    }
}
