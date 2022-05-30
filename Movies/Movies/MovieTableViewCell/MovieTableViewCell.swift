//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Aida Moldaly on 25.05.2022.
//

import UIKit

protocol UIdelegate {
    func goToNext() -> Void
    func goToDesc(index: Int) -> Void
}

class MovieTableViewCell: UITableViewCell {
    var delegate: UIdelegate?
    
    static var identifier = "MovieTableViewCell"
    
    private var genres: [Genre] = []
    
    private var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBAction func allButton(_ sender: UIButton) {
        delegate?.goToNext()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: Bundle(for: MovieCollectionViewCell.self)), forCellWithReuseIdentifier: "MovieCollectionViewCell")
    }
    
    func configure(with viewModel: (title: String?, movies: [Movie])) {
        self.titleLabel.text = viewModel.title
        self.movies = viewModel.movies
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
}

extension MovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.configure(with: movies[indexPath.item], genres: genres)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 128, height: 285)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.goToDesc(index: indexPath.row)

    }
    
}
