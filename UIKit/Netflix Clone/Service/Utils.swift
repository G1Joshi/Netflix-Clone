//
//  Utils.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 19/01/23.
//

import Foundation
import UIKit

struct Constants {
    static let API_KEY = ""
    static let baseURL = "https://api.themoviedb.org"
}

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

enum APIError: Error {
    case failedTogetData
}

func handleError(_ self: UIViewController, _ error: Error?) {
    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default)
    alert.addAction(action)
    DispatchQueue.main.async {
        self.present(alert, animated: true)
    }
}
