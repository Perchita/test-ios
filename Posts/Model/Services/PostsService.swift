//
//  PostsService.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import UIKit

import Moya

enum PostsService {
    case getPosts
    case getCommentsWithPostId(id: Int)
    case getUser(id: Int)
}

// MARK: TargetType Protocol Implementation

extension PostsService: TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.baseAPIURL)!
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "posts"
        case .getUser(let id):
            return "users/\(id)"
        case .getCommentsWithPostId(let id):
            return "posts/\(id)/comments"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPosts, .getCommentsWithPostId, .getUser:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPosts, .getCommentsWithPostId, .getUser:
            return .requestParameters(parameters: self.requestParameters, encoding: JSONEncoding.default)
        }
    }
        
    var requestParameters: [String: Any] {
            switch self {
            default:
                return [:]
            }
    }
        
    var sampleData: Data {
            switch self {
            default:
                return Data()
            }
    }
        
    var headers: [String : String]? {
            switch self {
            default:
                return [
                    "Accept":"application/json",
                    "Cookie":""
                ]
            }
        }
        
}
