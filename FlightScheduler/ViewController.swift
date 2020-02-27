//
//  ViewController.swift
//  FlightScheduler
//
//  Created by Rochelle Lawrence on 28/01/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

let retrievedString: String? = KeychainWrapper.standard.string(forKey: "access_token")

class ViewController: UIViewController {
    
    @IBAction func getToken(_ sender: Any) {
    
        loadToken()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    private let session: URLSession = .shared
    private func loadToken() {
        let url = URL(string: "https://api.lufthansa.com/v1/oauth/token/")!
        
        var request: URLRequest = URLRequest(url: url)
        let bodyData = "client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&grant_type=\(GRANT_TYPE)"
        request.httpMethod = "POST"
        request.httpBody = bodyData.data(using: .utf8)
        let task = session.dataTask(with: request) { (data, response, error) in

            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let jsonData = data else {
                    return
            }
            
            do {
                let userData = try JSONDecoder().decode(UserToken.self, from: jsonData)
                print("This is the user data: \(String(describing: userData.access_token))")
                let saveSuccessful: Bool = KeychainWrapper.standard.set(userData.access_token!, forKey: "access_token")
                try Keychain.set(value: (userData.access_token?.data(using: .utf8))!, account: "access_token")
                try Keychain.set(value: "YadaYada".data(using: .utf8)!, account: "password")
                let user = try Keychain.get(account: "access_token")
                print("This is the username bazinga \(String(describing: user))")

                print("Save was successful: \(saveSuccessful)")
                
            } catch {
                return
            }

            let retrievedString: String? = KeychainWrapper.standard.string(forKey: "access_token")
            print("The access token is: \(String(describing: retrievedString))")

        }

        
        
        task.resume()
    }



}



