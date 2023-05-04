//
//  ContentView.swift
//  MovieDbWithCombine
//
//  Created by Neha-NewOS on 04/05/2023.
//

import SwiftUI
import Combine

struct MovieView: View {
    @StateObject var movieViewModel: MovieViewModel

    var body: some View {
        List(movieViewModel.movies){movies in
            Text(movies.title)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movieViewModel: MovieViewModel(networkManager: NetworkManager()))
    }
}
