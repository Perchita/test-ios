//
//  HomePostsViewController.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import UIKit

import Result

class HomePostsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postsTableView: UITableView!
    
    var presenter: HomePostsPresenter
    
    // MARK: Initializers
    
    init(
        presenter: HomePostsPresenter
        ) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:; life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.delegate = self
        self.presenter.loadPosts()
        self.translateInterface()
        self.configureTableView()
    }
    
    //MARK: Actions
    
    //MARK: Private Methods
    
    private func translateInterface() {
        self.titleLabel.text = "POSTS"
    }
    
    private func configureTableView() {
        let cellNib = UINib(nibName: PostsTableViewCell.cellId, bundle: nil)
        self.postsTableView.register(cellNib, forCellReuseIdentifier: PostsTableViewCell.cellId)
    }
    
}

extension HomePostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.cellId, for: indexPath) as! PostsTableViewCell
        cell.post = self.presenter.posts?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = (self.presenter.posts?[indexPath.row])!
        let presenter = self.presenter.getPostInfopresenter(post: post)
        let controller = PostInfoViewController(presenter: presenter)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension HomePostsViewController: HomePostsPresenterDelegate {
    
    func didEndLoadPost(with result: Result<[Post], Error>) {
        switch result {
        case .success(_):
            self.postsTableView.reloadData()
        default:
            return
        }
    }
    
}
