//
//  PokemonViewModel.swift
//  pokedex
//
//  Created by Roy Cuenca on 10/07/2023.
//

import Foundation


class PokemonViewModel: ObservableObject {
    @Published var pokemonList = [PokemonModel]()
    @Published var filteredValues = [PokemonModel]()
    
    init () {
        getPokemonList()
    }
    
    func getPokemonList () {
        NetworkManager.getListOfPokemon(<#T##self: NetworkManager##NetworkManager#>)
    }
}
