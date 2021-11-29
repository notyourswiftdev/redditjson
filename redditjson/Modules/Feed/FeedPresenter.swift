//
//  Presenter.swift
//  redditjson
//
//  Created by Aaron Cleveland on 11/24/21.
//

import Foundation

protocol FeedPresenterProtocol {
    var router: FeedRouterProtocol? { get set }
    var interactor: FeedInteractorProtocol? { get set }
    var view: FeedViewProtocol? { get set }
}

class FeedPresenter: FeedPresenterProtocol {
    var router: FeedRouterProtocol?
    
    var interactor: FeedInteractorProtocol?
    
    var view: FeedViewProtocol?
}
