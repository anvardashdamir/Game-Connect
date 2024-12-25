//
//  ViewController.swift
//  Game Connect
//
//  Created by Enver Dashdemirov on 23.12.24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    private let topView = UIView()
    private let bottomView = UIView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let buttonStart = UIButton()
    private var slideshowCollectionView: UICollectionView!
    private var slideshowTimer: Timer?
    
    private let photos = [
        UIImage(named: "gtavicecity"),
        UIImage(named: "nfs"),
        UIImage(named: "thelastofus"),
        UIImage(named: "spider"),
        UIImage(named: "firefly"),
    ].compactMap { $0 }
    
    private var currentIndex = 0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        startSlideshow()
    }

    // MARK: - UI Setup
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        // Top View
        topView.backgroundColor = .white
        topView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topView)
        
        // Slideshow Collection View
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height / 3)
        layout.minimumLineSpacing = 0
        slideshowCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        slideshowCollectionView.isPagingEnabled = true
        slideshowCollectionView.showsHorizontalScrollIndicator = false
        slideshowCollectionView.register(SlideshowCell.self, forCellWithReuseIdentifier: "SlideshowCell")
        slideshowCollectionView.dataSource = self
        slideshowCollectionView.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(slideshowCollectionView)
        
        // Bottom View
        bottomView.backgroundColor = .black
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        
        // Title Label
        configureLabel(
            titleLabel,
            text: "Grow your insight with inspiring news.",
            font: .boldSystemFont(ofSize: 24),
            color: .white,
            alignment: .center
        )
        bottomView.addSubview(titleLabel)
        
        // Subtitle Label
        configureLabel(
            subtitleLabel,
            text: "Explore the world of analyzing news and sports where you will be submerged to games!",
            font: .systemFont(ofSize: 14),
            color: .white,
            alignment: .center
        )
        bottomView.addSubview(subtitleLabel)
        
        // Start Button
        buttonStart.setTitle("GET STARTED", for: .normal)
        buttonStart.setTitleColor(.white, for: .normal)
        buttonStart.backgroundColor = UIColor(red: 215/255, green: 4/255, blue: 4/255, alpha: 1)
        buttonStart.layer.cornerRadius = 7.5
        buttonStart.contentHorizontalAlignment = .center

        let arrowImage = UIImage(systemName: "chevron.right")
        buttonStart.setImage(arrowImage, for: .normal)
        buttonStart.tintColor = .white
        buttonStart.semanticContentAttribute = .forceRightToLeft
        buttonStart.titleEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 16)
        buttonStart.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -16)
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.addTarget(self, action: #selector(loginView), for: .touchUpInside)
        bottomView.addSubview(buttonStart)
    }
    
    private func configureLabel(_ label: UILabel, text: String, font: UIFont, color: UIColor, alignment: NSTextAlignment) {
        label.text = text
        label.font = font
        label.textColor = color
        label.textAlignment = alignment
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Layout
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Top View
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1.0/2.0),
            
            // Slideshow Collection View
            slideshowCollectionView.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.topAnchor),
            slideshowCollectionView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            slideshowCollectionView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            slideshowCollectionView.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            
            // Bottom View
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 60),
            titleLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -60),
            
            // Subtitle Label
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 60),
            subtitleLabel.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -60),
            
            // Start Button
            buttonStart.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 40),
            buttonStart.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 60),
            buttonStart.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -60),
            buttonStart.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    @objc private func loginView() {
        let signInVC = SignInViewController()
        let navigationController = UINavigationController(rootViewController: signInVC)
        navigationController.modalPresentationStyle = .formSheet
        present(navigationController, animated: true, completion: nil)
    }
    
    private func startSlideshow() {
        slideshowTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(nextSlide), userInfo: nil, repeats: true)
    }
    
    @objc private func nextSlide() {
        currentIndex = (currentIndex + 1) % photos.count
        let indexPath = IndexPath(item: currentIndex, section: 0)
        slideshowCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideshowCell", for: indexPath) as! SlideshowCell
        cell.imageView.image = photos[indexPath.item]
        return cell
    }
}

// MARK: - Slideshow Cell
class SlideshowCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
