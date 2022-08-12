//
//  OxfordDictionariesRepository.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 27.07.22.
//

import Foundation

protocol DictionariesRepository {
    func entries(of word: String, language: Language) async -> RetrieveEntryResponse?
}

final class OxfordDictionariesRepository: DictionariesRepository {
    private let appId = "30c65836"
    private let appKey = "98393f76981a3549edbdde7a3226b0ed"

    private let baseUrl = "https://od-api.oxforddictionaries.com:443/api"
    private let version = "v2"

    func entries(of word: String, language: Language) async -> RetrieveEntryResponse? {
        let endpoint = "entries"
        let wordId = word.lowercased()

        let url = URL(string: "\(baseUrl)/\(version)/\(endpoint)/\(language.localizableIdentifier)/\(wordId)")!

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(RetrieveEntryResponse.self, from: data)
        } catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
            return nil
        }
    }
}
