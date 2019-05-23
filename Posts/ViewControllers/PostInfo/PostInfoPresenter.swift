//
//  PostInfoPresenter.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import UIKit
import Result
import PKHUD

protocol PostInfoPresenterDelegate: class {
    func didEndLoadComments(with result: Result<[Comment], Error>)
    func didEndLoadUser(with result: Result<User, Error>)
}

final class PostInfoPresenter {
    
    private var postsData: PostsData
    weak var delegate: PostInfoPresenterDelegate?
    
    var post: Post
    var comments: [Comment]?
    var user: User?
    
    init(
        postsData: PostsData,
        post: Post,
        delegate: PostInfoPresenterDelegate? = nil
        ) {
        self.postsData = postsData
        self.post = post
        self.delegate = delegate
    }
    
    func loadData() {
        PKHUD.sharedHUD.show()
        self.postsData.getUser(id: self.post.userId ?? 0) { (result) in
            switch result {
            case .success(let user):
                self.user = user
                self.delegate?.didEndLoadUser(with: .success(user))
            case .failure(let error):
                self.delegate?.didEndLoadUser(with: .failure(error))
            }
        }
        
        self.postsData.getCommentsWithPostId(id: self.post.id ?? 0) { (result) in
            switch result {
            case .success(let comments):
                self.comments = comments
                self.delegate?.didEndLoadComments(with: .success(comments))
            case .failure(let error):
                self.delegate?.didEndLoadComments(with: .failure(error))
            }
        }
    }
    
}
