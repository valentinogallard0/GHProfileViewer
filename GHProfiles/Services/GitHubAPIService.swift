//
//  GitHubAPIService.swift
//  GHProfiles
//
//  Created by Valentino De Paola Gallardo on 02/09/25.
//

import Foundation

class GitHubAPIService {
    
    private let baseURL = "https://api.github.com"
    
    func fetchUser(username: String) async throws -> User{
        let url = URL(string: "\(baseURL)/users/\(username)")!
        return try await fetch(from: url, as: User.self)
    }
    
    func fetchRepos(username: String) async throws -> [Repositorio]{
        let url = URL(string: "\(baseURL)/users/\(username)/repos")!
        return try await fetch(from: url, as: [Repositorio].self)
    }
    
    func fetchFollowers(username: String) async throws -> [Followers]{
        let url = URL(string: "\(baseURL)/users/\(username)/followers")!
        return try await fetch(from: url, as: [Followers].self)
    }
    
    private func fetch<T: Decodable>(from url: URL, as type: T.Type) async throws -> T{
        let (data, responses) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = responses as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw GitHubAPIError.invalidResponses
        }
        do{
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch{
            throw GitHubAPIError.decodingFailed
        }
    }
}

enum GitHubAPIError: Error, LocalizedError {
    case invalidResponses
    case decodingFailed
    
    var errorDescription: String?{
        switch self{
            case .invalidResponses:
            return "La respuesta del servidor no fue valida."
            case .decodingFailed:
            return "No se pudo interpretar la informacion recibida."
        }
    }
}
