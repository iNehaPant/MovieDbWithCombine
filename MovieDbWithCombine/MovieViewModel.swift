//
//  MovieViewModel.swift
//  MovieDbWithCombine
//
//  Created by Neha-NewOS on 04/05/2023.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {

    @Published var movies = [Movie]()
    var networkManager:  Network
    var cancellable = Set<AnyCancellable>()

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        fetchData()
    }

    func fetchData() {
        self.networkManager.fetchData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {result in
                switch result {
                case .finished:
                    break;
                case .failure(let error):
                    print(error)
                }

            }, receiveValue: {[weak self] movies in
                guard let self = self else {return}
                self.movies  = movies.results
            })
            .store(in: &cancellable)
    }
}
