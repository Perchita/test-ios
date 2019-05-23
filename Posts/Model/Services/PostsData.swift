//
//  PostsData.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import Foundation

import Moya
import Result

class PostsData {
    
    static let shared: PostsData = {
        let instace = PostsData()
        return instace
    }()
    
    func defaultProvider() -> MoyaProvider<PostsService> {
        var plugins = [PluginType]()
        #if DEBUG
        plugins = [NetworkLoggerPlugin(verbose:true)]
        #endif
        let provider = MoyaProvider<PostsService>(plugins: plugins)
        return provider
    }
    
}

extension PostsData {
    
    func getPosts(completionHandler: @escaping (Result<[Post], Error>) -> Void) {
        self.defaultProvider().request(.getPosts) { (result) in
             self.manageResult(result: result, atKeyPath: "data", completion: completionHandler, databaseHandler: nil)
        }
    }
    
    func getUser(id: Int, completionHandler: @escaping (Result<User, Error>) -> Void) {
        self.defaultProvider().request(.getUser(id: id)) { (result) in
            self.manageResult(result: result, atKeyPath: "data", completion: completionHandler, databaseHandler: nil)
        }
    }
    
    func getCommentsWithPostId(id: Int, completionHandler: @escaping (Result<[Comment], Error>) -> Void) {
        self.defaultProvider().request(.getCommentsWithPostId(id: id)) { (result) in
            self.manageResult(result: result, atKeyPath: "data", completion: completionHandler, databaseHandler: nil)
        }
    }
    
    private func manageResult<ReturnType: Codable>(result: Result<Response, MoyaError>, atKeyPath: String? = nil, type: ReturnType.Type? = nil, completion: @escaping (Result<ReturnType, Error>) -> Void, databaseHandler: ((ReturnType) -> Void)? = nil) {
        let jsonDecoder = JSONDecoder()
        switch result {
        case let .success(response):
            if response.isValid() {
                do {
                    let responseObject = try response.map(ReturnType.self, atKeyPath: atKeyPath, using: jsonDecoder, failsOnEmptyData: false)
                    if let databaseHandler = databaseHandler {
                        databaseHandler(responseObject)
                    }
                    completion(.success(responseObject))
                } catch {
                    
                }
            }
        case .failure(let error):
            print(error)
        }
    }
    
}
