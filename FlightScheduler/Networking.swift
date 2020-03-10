//
//  Networking.swift
//  FlightScheduler
//
//  Created by Rochelle Lawrence on 27/02/2020.
//  Copyright © 2020 Practice. All rights reserved.
//

import Foundation



//client ID = mzmnxcmh2wc3mjcvd5dy8w96
//Secret = jdxPfEBTK3
//grant_type    "client_credentials"


private let linkedInKey = "mzmnxcmh2wc3mjcvd5dy8w96"
private let linkedInSecret = "jdxPfEBTK3"

func postBody(authorizationCode: String) -> String {
    let grantType = "client_credentials"
    let redirectURL = "https://api.lufthansa.com/v1/oauth/token"
    return [
        "grant_type":grantType,
        "code":authorizationCode,
        "redirect_uri":redirectURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed),
        "client_id":linkedInKey,
        "client_secret":linkedInSecret
    ].enumerated().compactMap {
        if let valueForKey = $1.value {
            return $1.key + "=" + valueForKey
        }
        return nil
    }.joined(separator: "&amp;")
    
}



func requestForAccessToken(authorizationCode: String) {
    if var urlComponents = URLComponents(string: "https://api.lufthansa.com/v1/oauth/token") {
        urlComponents.path = "/oauth"
        if let urlComponentsURL = urlComponents.url {
            var request = URLRequest(url: urlComponentsURL)
            request.httpMethod = "POST"
           // request.httpBody = self.postBody(authorizationCode: authorizationCode).data(using: .utf8)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in

            }
            task.resume()
        }
    }
}


//let session = URLSession(configuration: URLSessionConfiguration.default)
//let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
//
//}
//
//let headers = ["content-type": "application/x-www-form-urlencoded"]
//let postData = NSMutableData(data: "grant_type=client_credentials".data(using: String.Encoding.utf8)!)
//postData.append("&client_id=mzmnxcmh2wc3mjcvd5dy8w96".data(using: String.Encoding.utf8)!)
//postData.append("&client_secret=jdxPfEBTK3".data(using: String.Encoding.utf8)!)
//
////postData.append("&code=YOUR_AUTHORIZATION_CODE".data(using: String.Encoding.utf8)!)
////postData.append("&redirect_uri=https://YOUR_APP/callback".data(using: String.Encoding.utf8)!)






//func requestData(withurl : URL) {
//
//    let request = URLRequest(url: URL(string: "https://api.lufthansa.com/v1/oauth/token")! as URL,
//                                        cachePolicy: .useProtocolCachePolicy,
//                                        time,
//                                        outInterval: 10.0)
//request.httpMethod = "POST"
//request.allHTTPHeaderFields = headers
//request.httpBody = postData as Data
//
//let session = URLSession.shared
//let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//  if (error != nil) {
//    print(error)
//  } else {
//    let httpResponse = response as? HTTPURLResponse
//    print(httpResponse)
//  }
//})
//
//dataTask.resume()
//
//}



















//let apiUrl: URL = URL(string: "")
//
//   // Request data
//   func requestData(with url: URL) {
//          DispatchQueue.global(qos: .background).async {
//              let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
//                  if let data = data {
//                      let decoder = JSONDecoder()
//                      do {
//                          let flightdata = try decoder.decode([flight].self, from: data)
//                          self?.flights = flightData
//                          DispatchQueue.main.async {
//                              self?.tableView.reloadData()
//                          }
//                      } catch {
//                          print(error)
//                      }
//                  } else {
//                      // Handle error, show AlertController...
//                  }
//              }
//              task.resume()
//          }
//      }
//
   
