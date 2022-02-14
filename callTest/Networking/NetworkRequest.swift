//
//  NetworkManager.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation
import Combine

struct NetworkRequest {
    var request: URLRequest

    init(apiRequest: APIRequest) {
        let baseURL = "https://aircall-job.herokuapp.com"
        var urlComponents = URLComponents(string: baseURL)
        
        urlComponents?.path = apiRequest.path.rawValue
        urlComponents?.queryItems = apiRequest.queryItems
        
        guard let fullURL = urlComponents?.url else {
            assertionFailure("Could not build full URL")
            self.request = URLRequest(url: URL(string: "")!)
            return
        }
        
        self.request = URLRequest(url: fullURL)
        request.httpMethod = apiRequest.method.rawValue
        request.timeoutInterval = apiRequest.timeoutInterval
        
        if let body = apiRequest.params {
            let data = try? JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = data
        }
    
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
