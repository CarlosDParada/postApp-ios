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
    private let refreshControl = UIRefreshControl()
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
        tableView.refreshControl = refreshControl
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshPostsData(_:)), for: .valueChanged)
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
    @objc private func refreshPostsData(_ sender: Any) {
        // Fast Reload
        presenter?.fetchData()
    }
}

// MARK: - PostListViewContract
extension HomePostViewController: HomePostViewContract {
    func renderPostList(_ models: [PostCellViewModel]) {
        viewModel.postList = models
        refreshControl.endRefreshing()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imgString = viewModel.postList[indexPath.row].dataUser?.post?.picsPost?[0] ?? ""
        showImage(with: imgString)
    }
}
//Navigation
extension HomePostViewController {
    func showImage(with imageURLstring : String) {
        let imageSimpleViewController = ImagePostViewController(nibName: "ImagePostViewController", bundle: nil)
        imageSimpleViewController.modalPresentationStyle = .popover
        imageSimpleViewController.imageString = imageURLstring
        self.navigationController?.present(imageSimpleViewController, animated: true, completion: nil)

    }
}
