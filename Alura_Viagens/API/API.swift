//
//  API.swift
//  Alura_Viagens
//
//  Created by dtiDigital on 24/10/23.
// // /* https://github.com/public-apis/public-apis */

import Foundation

class MemesAPI {
    
    static func getMemes() async throws -> [Memes] {
        
        let endpoint = "https://api.imgflip.com/get_memes"
        
        guard let url = URL(string: endpoint) else {
            throw MemesErrors.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MemesErrors.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let memes = try decoder.decode(ResponseData.self, from: data)
            return memes.data.memes
        } catch {
            throw MemesErrors.invalidData
        }
        
    }
    
}
