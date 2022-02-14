//
//  APIRequest.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation

protocol APIRequest {
    var url: URL? { get }
    var path: APIPaths { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var params: Any? { get }
    var timeoutInterval: TimeInterval { get }
}

extension APIRequest {
    // Default values
    var url: URL? { nil }
    var queryItems: [URLQueryItem]? { nil }
    var params: Any? { nil }
    var timeoutInterval: TimeInterval { 10.0 }
}


