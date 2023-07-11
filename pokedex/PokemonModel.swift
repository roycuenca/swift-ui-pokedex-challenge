//
//  PokemonModel.swift
//  pokedex
//
//  Created by Roy Cuenca on 10/07/2023.
//

import Foundation

struct PokemonModel: Codable, Hashable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
}
