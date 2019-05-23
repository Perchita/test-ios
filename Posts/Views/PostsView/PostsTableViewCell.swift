//
//  PostsTableViewCell.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    static let cellId = "PostsTableViewCell"
    static let cellHeight: CGFloat = 90
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var post: Post? {
        didSet {
            self.fillData()
        }
    }
    
    //MARK: Private methods
    
    private func fillData() {
        guard let post = self.post else {
            return
        }
        self.titleLabel.text = post.title
        self.descriptionLabel.text = post.body
    }
    
}
