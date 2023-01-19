//
//  Movie.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 19/01/23.
//

struct Movie: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
