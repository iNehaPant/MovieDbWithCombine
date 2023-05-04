//
//  NetworkManager.swift
//  MovieDbWithCombine
//
//  Created by Neha-NewOS on 04/05/2023.
//

import Foundation
import Combine

let baseURL  = "https://api.themoviedb.org/3/movie/popular?api_key=e600ae42efca88a43a1c4ddaedd275fe&language=en-US&page=1"

protocol Network {
    func fetchData() -> AnyPublisher<Movies, Error>
}

struct NetworkManager: Network {
    func fetchData() -> AnyPublisher<Movies, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: baseURL)!)
            .map{$0.data}
            .decode(type: Movies.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}
