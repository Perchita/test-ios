//
//  Company.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import Foundation

class Company: Codable {
    
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case bs
    }
    
}
