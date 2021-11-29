//
//  Feed.swift
//  redditjson
//
//  Created by Aaron Cleveland on 11/24/21.
//

import Foundation

// https://www.reddit.com/.json

struct Feed: Codable {
    var image: String
    var title: String
    var commentNumber: String
    var scoreAPI: String
}
