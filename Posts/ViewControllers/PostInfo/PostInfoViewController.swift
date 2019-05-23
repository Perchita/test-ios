//
//  PostInfoViewController.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import UIKit

import Result
import PKHUD

class PostInfoViewController: UIViewController {

    @IBOutlet weak var userInfoStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var presenter: PostInfoPresenter
    
    // MARK: Initializers
    
    init(
        presenter: PostInfoPresenter
        ) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.delegate = self
        self.presenter.loadData()
        self.translateInterface()
        self.configureTableView()
        self.fillData()
    }
    
    //MARK: Actions
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Private methods

    private func translateInterface() {
        //TODO: Complete with localiced strings to translate the app.
    }
    
    private func configureTableView() {
        let cellNib = UINib(nibName: CommentTableViewCell.cellId, bundle: nil)
        self.commentsTableView.register(cellNib, forCellReuseIdentifier: CommentTableViewCell.cellId)
    }
    
    private func fillData() {
        self.titleLabel.text = self.presenter.post.title
        self.bodyLabel.text = self.presenter.post.body
        self.usernameLabel.text = self.presenter.user?.username
        self.emailLabel.text = self.presenter.user?.email
        self.companyLabel.text = self.presenter.user?.company?.name
        self.phoneLabel.text = self.presenter.user?.phone
        self.commentsTableView.reloadData()
    }
    
}

extension PostInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.cellId, for: indexPath) as! CommentTableViewCell
        
        cell.comment = self.presenter.comments?[indexPath.row]
        return cell
    }

}

extension PostInfoViewController: PostInfoPresenterDelegate {
    
    func didEndLoadUser(with result: Result<User, Error>) {
        switch result {
        case .failure(_):
            self.userInfoStackView.isHidden = true
        default:
            PKHUD.sharedHUD.hide()
            return
        }
    }
    
    func didEndLoadComments(with result: Result<[Comment], Error>) {
        switch result {
        case .success(_):
            self.fillData()
            PKHUD.sharedHUD.hide()
        default:
            PKHUD.sharedHUD.hide()
            return
        }
    }
    
}
