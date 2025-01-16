//
//  NewsData.swift
//  WorkoutApp
//
//  Created by Peter on 16.12.2023.
//

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let status: String
    let totalResults: Int
    let results: [Result]
    let nextPage: String
}

// MARK: - Result
struct Result: Codable {
    let articleID, title: String
    let link: String
    let keywords, creator: [String]?
    let videoURL: JSONNull?
    let description: String?
    let content, pubDate: String
    let imageURL: String?
    let sourceID: String
    let sourcePriority: Int
    let country, category: [String]
    let language: Language

    enum CodingKeys: String, CodingKey {
        case articleID = "article_id"
        case title, link, keywords, creator
        case videoURL = "video_url"
        case description, content, pubDate
        case imageURL = "image_url"
        case sourceID = "source_id"
        case sourcePriority = "source_priority"
        case country, category, language
    }
}

enum Language: String, Codable {
    case english = "english"
}

// MARK: - Encode/decode helpers
final class JSONNull: Codable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
