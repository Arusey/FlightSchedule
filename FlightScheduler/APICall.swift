//
//  APICall.swift
//  FlightScheduler
//
//  Created by macbook on 26/02/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem

}

let GRANT_TYPE = "credentials"
let CLIENT_ID = "xuzza9nuseytv3m59fyytrue"
let CLIENT_SECRET = "mCH385mArn"

struct APIRequest {
    let resourceURL: URL

    init(endpoint: String) {
        let resourceString = "https://api.lufthansa.com/v1/oauth/token/"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
        
    }
    
    func requestToken(_ getUserToken: UserToken, completion: @escaping (Result<UserToken, APIError>) -> Void) {
        
        do {
            var requestString = "grant_type=\(GRANT_TYPE)"
            requestString += "&client_id=\(CLIENT_ID)"
            requestString += "&client_secret=\(CLIENT_SECRET)"

            
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = Data(requestString.utf8)
            urlRequest.httpBody = try JSONEncoder().encode(getUserToken)
            
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest)
            {
                data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200, let jsonData = data else {
                        completion(.failure(.responseProblem))
                        return
                }
                
                do {
                    let userData = try JSONDecoder().decode(UserToken.self, from: jsonData)
                    completion(.success(userData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
            
            
        }
        catch {
            completion(.failure(.encodingProblem))
        }
       
    }
}
