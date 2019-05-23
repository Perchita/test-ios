//
//  Comment.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import Foundation

class Comment: Codable {
    
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case postId
        case id
        case name
        case email
        case body
    }
    
}
