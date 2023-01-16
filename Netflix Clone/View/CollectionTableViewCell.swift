//
//  CollectionTableViewCell.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 16/01/23.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    static let identifier = "CollectionTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
