//
//  TabBarController.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 16/01/23.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.title = "Home"
        homeViewController.tabBarItem.image = UIImage(systemName: "house.circle")

        let upomingViewController = UINavigationController(rootViewController: UpcomingViewController())
        upomingViewController.title = "Upcoming"
        upomingViewController.tabBarItem.image = UIImage(systemName: "play.circle")

        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        searchViewController.title = "Search"
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")

        let downloadViewController = UINavigationController(rootViewController: DownloadViewController())
        downloadViewController.title = "Download"
        downloadViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line.circle")

        tabBar.tintColor = .label

        setViewControllers([homeViewController, upomingViewController, searchViewController, downloadViewController], animated: true)
    }
}
