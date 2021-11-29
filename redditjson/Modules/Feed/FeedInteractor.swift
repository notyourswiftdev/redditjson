//
//  Interactor.swift
//  redditjson
//
//  Created by Aaron Cleveland on 11/24/21.
//

import Foundation

protocol FeedInteractorProtocol {
    var presenter: FeedPresenterProtocol? { get set }
}

class FeedInteractor: FeedInteractorProtocol {
    var presenter: FeedPresenterProtocol?
    
    
}
