//
//  HomePostsPresenter.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import UIKit
import Result

protocol HomePostsPresenterDelegate: class {
    func didEndLoadPost(with result: Result<[Post], Error>)
}

final class HomePostsPresenter {
    
    private var postsData: PostsData
    weak var delegate: HomePostsPresenterDelegate?
    
    var posts: [Post]?
    
    init(
        postsData: PostsData,
        delegate: HomePostsPresenterDelegate? = nil
        ) {
        self.postsData = postsData
        self.delegate = delegate
    }
    
    func loadPosts() {
        self.postsData.getPosts { (result) in
            switch result {
            case .success(let posts):
                self.posts = posts
                self.delegate?.didEndLoadPost(with: .success(posts))
            case .failure(let error):
                self.delegate?.didEndLoadPost(with: .failure(error))
            }
        }
    }
    
    func getPostInfopresenter(post: Post) -> PostInfoPresenter {
        let presenter = PostInfoPresenter(postsData: self.postsData, post: post)
        return presenter
    }
    
}
