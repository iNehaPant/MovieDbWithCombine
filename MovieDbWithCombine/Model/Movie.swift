//
//  Movie.swift
//  MovieDbWithCombine
//
//  Created by Neha-NewOS on 04/05/2023.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
}
