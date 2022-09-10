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
    private let networkLayer: NetworkLayer = DefaultNetworkLayer()

    private let appId = "30c65836"
    private let appKey = "98393f76981a3549edbdde7a3226b0ed"

    private let baseUrl = "https://" + "od-api.oxforddictionaries.com" + ":443/api"
    private let version = "v2"

    func entries(of word: String, language: Language, wordBundleId: UUID) async -> Word? {
        let endpoint = "entries"
        let wordId = word.trimmed()

        guard let url = URL(string: "\(baseUrl)/\(version)/\(endpoint)/\(language.localizableIdentifier)/\(wordId)") else { return nil }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")

        guard let response = await networkLayer.download(RetrieveEntryResponse.self, using: request) else { return nil }
        return .make(from: response, bundleId: wordBundleId)
    }
}
