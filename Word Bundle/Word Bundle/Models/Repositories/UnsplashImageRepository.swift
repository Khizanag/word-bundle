//
//  UnsplashImageRepository.swift
//  Word Bundle
//
//  Created by Mariam Ormotsadze on 05.09.22.
//

import Foundation

protocol ImageRepository {
    func getFullUrl(of word: String) async -> String?
}

final class UnsplashImageRepository: ImageRepository {
    func getFullUrl(of word: String) async -> String? {
        let clientID = "WxvZ6NKKvHcB_6jwRYBI9HuokIpaMOvNgogbSBXxKeE"
        let fullUrl = "https://api.unsplash.com/search/photos?page=1&query=\(word)&client_id=\(clientID)"
        
        guard let url = URL(string: fullUrl) else { return nil }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let jsonResult = try JSONDecoder().decode(UnsplashImageResponse.self, from: data)
            
            return jsonResult.results.first?.urls.full
        }  catch {
            // Error handling in case the data couldn't be loaded
            debugPrint("Error loading \(url): \(String(describing: error))")
            return nil
        }
    }
}
