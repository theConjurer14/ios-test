//
//  NetworkRequester.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation
import Combine

class NetworkRequester {
    private var subscriber = Set<AnyCancellable>()
    
    func requestService<T: Decodable>(request: NetworkRequest, completion: @escaping (Result<T, Error>) -> Void) {
        
        //Cast date format recieved from API
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.APIFormat)
        
        URLSession.shared.dataTaskPublisher(for: request.request)
            .map{ $0.data }
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .finished:
                    return
                }
            } receiveValue: { result in
                completion(.success(result))
            }
            .store(in: &subscriber)
    }
}
