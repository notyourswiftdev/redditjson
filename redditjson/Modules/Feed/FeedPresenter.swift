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
    
    func interactorDidFetchFeed(with result: Result<[Feed], Error>)
}

class FeedPresenter: FeedPresenterProtocol {
    var router: FeedRouterProtocol?
    
    var interactor: FeedInteractorProtocol?
    
    var view: FeedViewProtocol?
    
    func interactorDidFetchFeed(with result: Result<[Feed], Error>) {
        switch result {
        case .success(let feed):
            view?.update(with: feed)
        case .failure:
            view?.update(with: "Something went wrong.")
        }
    }
}
