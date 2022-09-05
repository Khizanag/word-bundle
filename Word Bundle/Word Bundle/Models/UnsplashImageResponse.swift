//
//  UnsplashImageResponse.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 05.09.22.
//

import Foundation


struct UnsplashImageResponse: Codable {
    let results: [Result]
    
    struct Result: Codable {
        let urls: URLs
    }

    struct URLs: Codable {
        let full: String
    }
}
