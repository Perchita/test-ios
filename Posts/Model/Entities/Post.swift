//
//  Post.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import Foundation

class Post: Codable {
    
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
    
}
