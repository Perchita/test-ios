//
//  Response.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import Moya

extension Response {
    
    public func isValid() -> Bool {
        let validStatusCodes: [Int] = [200, 201, 202, 203, 204, 205, 206, 207, 208]
        let isValid = validStatusCodes.contains(self.statusCode)
        return isValid
    }
    
    public func isAuthError() -> Bool {
        return self.statusCode == 401
    }
    
}
