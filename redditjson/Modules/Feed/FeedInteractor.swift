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
    
    func getFeed() {
        let urlString = URL(string: "https://www.reddit.com/.json")
        guard let url = urlString else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                self.presenter?.interactorDidFetchFeed(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let feedEntity = try JSONDecoder().decode([Feed].self, from: data)
                self.presenter?.interactorDidFetchFeed(with: .success(feedEntity))
            } catch {
                self.presenter?.interactorDidFetchFeed(with: .failure(error))
            }
        }
        .resume()
    }
}
