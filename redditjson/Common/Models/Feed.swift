//
//  Feed.swift
//  redditjson
//
//  Created by Aaron Cleveland on 11/24/21.
//

import Foundation
import UIKit

// https://www.reddit.com/.json

struct Feed: Codable {
    var title: String?
    var thumbnail: String?
    var numComments: Int?
    var score: Int?

    enum CodingKeys: String, CodingKey {
        case numComments = "num_comments"
    }
}
