//
//  Feed.swift
//  redditjson
//
//  Created by Aaron Cleveland on 11/24/21.
//

import Foundation
import UIKit

// https://www.reddit.com/.json

struct AllFeeds: Codable {
    let feedChildData: FeedChildData

    enum CodingKeys: String, CodingKey {
        case feedChildData = "data"
    }
}

struct FeedChildData: Codable {
    let children: [FeedChild]
}

struct FeedChild: Codable {
    let data: FeedData
}

struct FeedData: Codable {
    let score: Int
    let thumbnail: String
    let title: String
    let numComments: Int
}
