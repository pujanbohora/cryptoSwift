//
//  NetworkManager.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/12/24.
//

import Foundation
import Combine

class NetworkManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL. \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        
        let temp = URLSession.shared.dataTaskPublisher(for: url)
        .subscribe(on: DispatchQueue.global(qos: .default))
        .tryMap({ try handlURLResponse(output: $0, url: url)})
        ///Checking through main thread
        .receive(on: DispatchQueue.main)
        ///Converting type of func to AnyPublisher
        .eraseToAnyPublisher()
        
        return temp
        
    }
    
    static func handlURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion : Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("[🔥]: \(error.localizedDescription)")
        }
    }
}
