//
//  Address.swift
//  Posts
//
//  Created by Jose Enrique on 23/05/2019.
//  Copyright © 2019 TIMP. All rights reserved.
//

import Foundation

class Geo: Codable {
    
    var lat: String?
    var long: String?
    
    enum CodingKeys: String, CodingKey {
        case lat
        case long
    }
}

class Address: Codable {
    
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    
    enum CodingKeys: String, CodingKey {
        case street
        case suite
        case city
        case zipcode
        case geo
    }
    
}
