//
//  OxfordDictionariesRepository.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 27.07.22.
//

import Foundation

protocol DictionariesRepository {
    func entries(of word: String, language: Language, wordBundleId: UUID) async -> Word?
}

final class OxfordDictionariesRepository: DictionariesRepository {
    // TODO: refactor
    private let appId = "30c65836"
    private let appKey = "98393f76981a3549edbdde7a3226b0ed"

    private let baseUrl = "https://" + "od-api.oxforddictionaries.com" + ":443/api"
    private let version = "v2"

    func entries(of word: String, language: Language, wordBundleId: UUID) async -> Word? {
        let endpoint = "entries"
        let wordId = word.lowercased() // FIXME: when there is space in input

        guard let url = URL(string: "\(baseUrl)/\(version)/\(endpoint)/\(language.localizableIdentifier)/\(wordId)") else { return nil }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(RetrieveEntryResponse.self, from: data)
            return .make(from: response, bundleId: wordBundleId)
        } catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading \(url): \(String(describing: error))")
            return nil
        }
    }
}
