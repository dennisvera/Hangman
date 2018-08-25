//
//  ReachClient.swift
//  HangMan
//
//  Created by Dennis Vera on 8/25/18.
//  Copyright © 2018 Dennis Vera. All rights reserved.
//

import Foundation

class ReachClient {
    
    // MARK: - Requesting Data
    
    class func fetchReachData() {
        let urlString = "http://app.linkedin-reach.io/words"
        
        guard let url = URL(string: urlString) else { fatalError("Invalid URL") }
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let urlRequest = URLRequest(url: url)
        
        // Create Data Task
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Response Status Code: \(response.statusCode)\n")
            }
            
            if let error = error {
                print("Unable To Fetch Reach Data: \(error)\n")
            } else {
                guard let data = data else { fatalError("Unable to get data") }
                
                guard let words = String(data: data, encoding: .utf8) else { return }
                
                print(words)
            }
        }
        
        dataTask.resume()
    }
    
}
