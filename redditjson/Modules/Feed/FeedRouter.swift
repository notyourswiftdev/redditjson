//
//  Router.swift
//  redditjson
//
//  Created by Aaron Cleveland on 11/24/21.
//

import Foundation
import UIKit

typealias FeedEntryPoint = FeedViewProtocol & UIViewController

protocol FeedRouterProtocol {
    var entry: FeedEntryPoint? { get }
    static func feedStart() -> FeedRouterProtocol
}

class FeedRouter: FeedRouterProtocol {
    var entry: FeedEntryPoint?
    
    static func feedStart() -> FeedRouterProtocol {
        let router = FeedRouter()
        
        var view: FeedViewProtocol = FeedViewController()
        var presenter: FeedPresenterProtocol = FeedPresenter()
        var interactor: FeedInteractorProtocol = FeedInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? FeedEntryPoint
        
        return router
    }
}
