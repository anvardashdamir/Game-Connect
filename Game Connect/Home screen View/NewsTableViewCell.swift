//
//  NewsTableViewCell.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    // UI Components
    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headlineLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mediaSourceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup UI
    private func setupUI() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(headlineLabel)
        contentView.addSubview(mediaSourceLabel)
        contentView.addSubview(dateLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            // News Image
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            newsImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            newsImageView.widthAnchor.constraint(equalToConstant: 80),
            newsImageView.heightAnchor.constraint(equalToConstant: 80),
            
            // Headline Label
            headlineLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            headlineLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10),
            headlineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            // Media Source Label
            mediaSourceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            mediaSourceLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 10),
            
            // Date Label
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: mediaSourceLabel.trailingAnchor, constant: 10),
            
            // Bottom Padding
            contentView.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10)
        ])
    }
    
    // Configure Cell
    func configure(with news: NewsItem) {
        newsImageView.image = UIImage(named: news.imageName)
        headlineLabel.text = news.headline
        mediaSourceLabel.text = news.mediaSource
        dateLabel.text = news.date
    }
}


