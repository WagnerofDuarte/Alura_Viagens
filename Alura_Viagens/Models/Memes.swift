//
//  MemesImages.swift
//  Alura_Viagens
//
//  Created by Wagner Duarte on 02/11/23.
//

import Foundation

struct Memes: Codable {
    //MARK: Atributes
    let id: Int
    let name: String
    let url: String
}

enum MemesErrors: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

struct MemesData: Codable {
    let memes: [Memes]
}

struct ResponseData: Codable {
    let success: Bool
    let data: MemesData
}
