//
//  HomeScreenViewController.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = "Game News"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let newsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // Mock data for testing
    private let newsItems: [NewsItem] = [
        NewsItem(
            imageName: "newsGTA",
            headline: "Where the heck is new GTA VI trailer?",
            mediaSource: "IGN",
            date: "Dec 23, 2024"
        ),
        NewsItem(
            imageName: "newsPS530",
            headline: "Sony Releases Special PS5 for 30th Anniversary",
            mediaSource: "Gamespot",
            date: "Dec 22, 2024"
        ),
        NewsItem(
            imageName: "newsSilentHill",
            headline: "Put holy water on your PlayStation before playing Silent Hill 2",
            mediaSource: "IGDB",
            date: "Dec 21, 2024"
        ),
        NewsItem(
            imageName: "newsIN",
            headline: "Infinity Nikki isn't for everyone",
            mediaSource: "IGN",
            date: "Dec 23, 2024"
        ),
        NewsItem(
            imageName: "newsCharacters",
            headline: "The 10 Best Game Stories of 2024",
            mediaSource: "Gamespot",
            date: "Dec 22, 2024"
        ),
        NewsItem(
            imageName: "newsGOD",
            headline: "Save 20% on God of War Ragnarok on Steam",
            mediaSource: "Gamespot",
            date: "Dec 22, 2024"
        ),
        NewsItem(
            imageName: "newsAstro",
            headline: "Astro Bot Wins Game of the Year Award",
            mediaSource: "IGDB",
            date: "Dec 21, 2024"
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupTableView()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(headLabel)
        view.addSubview(newsTableView)
        
        // Set up Auto Layout constraints for the label and table view
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            newsTableView.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 16),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Table View Setup
    private func setupTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
             return UITableViewCell()
         }
         let newsItem = newsItems[indexPath.row]
         cell.configure(with: newsItem)
         return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle cell selection
        print("Selected News: \(newsItems[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
