//
//  FeedViewController.swift
//  redditjson
//
//  Created by Aaron Cleveland on 11/24/21.
//

import Foundation
import UIKit

protocol FeedViewProtocol {
    var presenter: FeedPresenterProtocol? { get set }
}

class FeedViewController: UIViewController, FeedViewProtocol {
    var presenter: FeedPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    // MARK: - Functions -
}

// MARK: - Extensions -
