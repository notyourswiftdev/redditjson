//
//  Presenter.swift
//  redditjson
//
//  Created by Aaron Cleveland on 11/24/21.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol FeedPresenterProtocol {
    var router: FeedRouterProtocol? { get set }
    var interactor: FeedInteractorProtocol? { get set }
    var view: FeedViewProtocol? { get set }
    
    func interactorDidFetchFeed(with result: Result<[FeedData], Error>)
}

class FeedPresenter: FeedPresenterProtocol {
    var router: FeedRouterProtocol?
    var interactor: FeedInteractorProtocol? {
        didSet {
            interactor?.getFeed()
        }
    }
    var view: FeedViewProtocol?
    
    func interactorDidFetchFeed(with result: Result<[FeedData], Error>) {
        switch result {
        case .success(let feed):
            view?.update(with: feed)
        case .failure:
            view?.update(with: "Something went wrong.")
        }
    }
}
