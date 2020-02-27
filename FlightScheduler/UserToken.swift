//
//  UserToken.swift
//  FlightScheduler
//
//  Created by macbook on 27/02/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import Foundation

class UserToken: Codable {
    var client_id: String?
    var client_secret: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case client_id
        case client_secret
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        client_id = try? container.decode(String.self, forKey: .client_id)
        client_secret = try? container.decode(String.self, forKey: .client_secret)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(client_id, forKey: .client_id)
        try container.encode(client_secret, forKey: .client_secret)
    }
    
    
    init(client_id: String, client_secret: String) {
        self.client_id = client_id
        self.client_secret = client_secret
    }
    
}
