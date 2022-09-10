//
//  NetworkLayer.swift
//  Word Bundle
//
//  Created by Giga Khizanishvili on 10.09.22.
//

import Foundation

// MARK: - Protocol
public protocol NetworkLayer {
    func download<T>(_ type: T.Type, using request: URLRequest) async -> T? where T: Decodable
}

// MARK: - Implementation
public final class DefaultNetworkLayer: NetworkLayer {
    public func download<T>(_ type: T.Type, using request: URLRequest) async -> T? where T: Decodable {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let response = try decoder.decode(type, from: data)
            return response
        } catch {
            // Error handling in case the data couldn't be loaded
            // For now, only display the error on the console
            debugPrint("Error loading: \(String(describing: error))")
            return nil
        }
    }
}
