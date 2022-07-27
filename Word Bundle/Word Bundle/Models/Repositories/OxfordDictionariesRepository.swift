//
//  OxfordDictionariesRepository.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 27.07.22.
//

import Foundation

protocol DictionariesRepository {
    func entries(of word: String, language: Language)
}

final class OxfordDictionariesRepository: DictionariesRepository {
    private let appId = "30c65836"
    private let appKey = "98393f76981a3549edbdde7a3226b0ed"
    private let baseUrl = "https://od-api.oxforddictionaries.com:443/api"
    private let version = "v2"

    func entries(of word: String, language: Language) {
        let endpoint = "entries"
        let wordId = word.lowercased()

        let url = URL(string: "\(baseUrl)/\(version)/\(endpoint)/\(language.localizableIdentifier)/\(wordId)")!

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")

        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response,
               let data = data,
               let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print(response)
                print(jsonData)
            } else {
                print(error!)
                print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!)
            }
        })
        .resume()
    }
}
