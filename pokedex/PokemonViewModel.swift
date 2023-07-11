//
//  PokemonViewModel.swift
//  pokedex
//
//  Created by Roy Cuenca on 10/07/2023.
//

import SwiftUI


class PokemonViewModel: ObservableObject {
    @Published var pokemonList = [PokemonModel]()
    @Published var filteredValues = [PokemonModel]()
    
    init () {
        getPokemonList()
    }
    
    func getPokemonList() {
        NetworkManager.shared.getListOfPokemon {result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemonList):
                    self.pokemonList = pokemonList
                    self.filteredValues = pokemonList
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func filterPokemon(name: String) {
        if name.isEmpty {
            filteredValues = pokemonList
        } else {
            filteredValues = pokemonList.filter({pokemon in
                pokemon.name.lowercased().contains(name.lowercased())
            })
        }
    }
    
    func getColorBasedOnType(type: String) -> Color {
        switch type {
        case "poison":
            return .purple
        case "fire":
            return .red
        case "water":
            return .blue
        case "bug", "grass":
            return .green
        case "flying":
            return .mint
        case "normal":
            return .pink
        case "electric":
            return .yellow
        case "ground":
            return .brown
        case "fairy", "psychic", "dragon":
            return .orange
        case "fighting":
            return .gray
        case "ice", "steel":
            return .teal
        default:
            return .white
        }
    }
    
}

struct MockPokemon {
    static let pokemon = PokemonModel(
        id: 133,
      attack: 55,
      defense: 50,
      description: "Its genetic code is irregular. It may mutate if it is exposed to radiation from element STONEs.",
      
      name: "eevee",
      imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2FAFC7F2B7-B889-4F56-935A-9E95E00AD65B?alt=media&token=14a27205-6033-48ad-b4ce-1154876414f7",
      type: "normal"
    )
}
