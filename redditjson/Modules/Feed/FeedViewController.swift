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
    
    func update(with feed: [FeedData])
    func update(with error: String)
}

class FeedViewController: UIViewController, FeedViewProtocol {
    var presenter: FeedPresenterProtocol?
    
    var feed: [FeedData] = []
    
    // MARK: - UIComponents -
    private lazy var feedTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "feedCell")
        tableView.isHidden = true
        return tableView
    }()
    
    // MARK: - Lifecycles -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureConstraints()
    }
    
    // MARK: - Functions -
    private func configureUI() {
        view.backgroundColor = .white
        
        configureDelegates()
    }
    
    private func configureDelegates() {
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    // MARK: - Protocol Functions -
    func update(with feed: [FeedData]) {
        DispatchQueue.main.async {
            self.feed = feed
            self.feedTableView.reloadData()
            self.feedTableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.feed = []
            self.feedTableView.isHidden = true
            let alertController = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

// MARK: - Extension TableView -
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath)
        
        cell.textLabel?.text = feed[indexPath.row].title
        return cell
    }
}

// MARK: - Extension Constraints -
extension FeedViewController {
    private func configureConstraints() {
        let safe = view.safeAreaLayoutGuide
        
        view.addSubview(feedTableView)
        NSLayoutConstraint.activate([
            feedTableView.topAnchor.constraint(equalTo: safe.topAnchor),
            feedTableView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
            feedTableView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            feedTableView.leadingAnchor.constraint(equalTo: safe.leadingAnchor)
        ])
    }
}
