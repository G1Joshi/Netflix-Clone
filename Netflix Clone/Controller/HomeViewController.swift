//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 16/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    var homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(homeFeedTable)

        configureNavbar()

        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        homeFeedTable.tableHeaderView = HeroHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

    func configureNavbar() {
        var logo = UIImage(named: "netflixLogo")
        logo = logo?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logo, style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: view.bounds.width)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.circle"), style: .done, target: self, action: nil),
        ]
        navigationController?.navigationBar.tintColor = .white
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as? CollectionTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
