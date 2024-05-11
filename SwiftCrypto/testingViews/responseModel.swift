//
//  responseModel.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/11/24.
//

import Foundation


struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
