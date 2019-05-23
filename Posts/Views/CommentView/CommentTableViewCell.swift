//
//  CommentTableViewCell.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    static let cellId = "CommentTableViewCell"
    static let cellHeight: CGFloat = 100
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var comment: Comment? {
        didSet {
            self.fillData()
        }
    }
    
    //MARK: Private methods
    
    private func fillData() {
        guard let comment = self.comment else {
            return
        }
        self.titleLabel.text = comment.name
        self.emailLabel.text = comment.email
        self.commentLabel.text = comment.body
    }
    
}
