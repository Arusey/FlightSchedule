//
//  UserToken.swift
//  FlightScheduler
//
//  Created by macbook on 27/02/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import Foundation

class UserToken: Codable {
    var access_token: String?
    var token_type: String?
    var expires_in: Int
    
    
    private enum CodingKeys: String, CodingKey {
        case access_token
        case token_type
        case expires_in
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        access_token = try? container.decode(String.self, forKey: .access_token)
        token_type = try? container.decode(String.self, forKey: .token_type)
        expires_in = try! container.decode(Int.self, forKey: .expires_in)
        
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(access_token, forKey: .access_token)
        try container.encode(token_type, forKey: .token_type)
        try container.encode(expires_in, forKey: .expires_in)
    }
    
    
    init(access_token: String, token_type: String, expires_in: Int) {
        self.access_token = access_token
        self.token_type = token_type
        self.expires_in = expires_in
    }
    
}
