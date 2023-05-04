//
//  MovieDbWithCombineApp.swift
//  MovieDbWithCombine
//
//  Created by Neha-NewOS on 04/05/2023.
//

import SwiftUI

@main
struct MovieDbWithCombineApp: App {
    var body: some Scene {
        WindowGroup {
            MovieView(movieViewModel: MovieViewModel(networkManager: NetworkManager()))
        }
    }
}
