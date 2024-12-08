//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 19/01/23.
//

import Foundation

class APICaller {
    static let shared = APICaller()

    private func fetchData(_ endpoint: String, _ completion: @escaping (Result<[Title], Error>) -> Void) {
        if let url = URL(string: endpoint) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if error == nil {
                    if let data = data {
                        do {
                            let results = try JSONDecoder().decode(Movie.self, from: data)
                            completion(.success(results.results))
                        } catch {
                            completion(.failure(APIError.failedTogetData))
                        }
                    }
                }
            }
            task.resume()
        }
    }

    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        let endpoint = "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)"
        fetchData(endpoint, completion)
    }

    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        let endpoint = "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)"
        fetchData(endpoint, completion)
    }

    func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void) {
        let endpoint = "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)"
        fetchData(endpoint, completion)
    }

    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        let endpoint = "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)"
        fetchData(endpoint, completion)
    }

    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        let endpoint = "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)"
        fetchData(endpoint, completion)
    }
}
