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
    private let clientID = "WxvZ6NKKvHcB_6jwRYBI9HuokIpaMOvNgogbSBXxKeE"
    private let baseUrl = "https://" + "api.unsplash.com"
    private let imageEndpoint = "search/photos"

    func getFullUrl(of word: String) async -> String? {
        let word = word.trimmed()
        let queryParams: [String: String] = [
            "page": "1",
            "query": word,
            "client_id": clientID
        ]

        let fullUrl = "\(baseUrl)/\(imageEndpoint)?\(queryParams.asQueryString)"

        guard let url = URL(string: fullUrl) else { return nil }

        let request = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let jsonResult = try JSONDecoder().decode(UnsplashImageResponse.self, from: data)

            return jsonResult.results.first?.urls.full
        } catch {
            // Error handling in case the data couldn't be loaded
            debugPrint("Error loading \(url): \(String(describing: error))")
            return nil
        }
    }
}
