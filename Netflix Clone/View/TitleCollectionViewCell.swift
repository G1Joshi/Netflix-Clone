//
//  TitleCollectionViewCell.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 19/01/23.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"

    private let posterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }

    func configure(with model: String) {
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let imageData = data else {
                    DispatchQueue.main.async {
                        self.posterImageView.image = UIImage(named: "heroImage")
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.posterImageView.image = UIImage(data: imageData)
                }
            }.resume()
        }
    }
}
