//
//  ContentView.swift
//  pokedex
//
//  Created by Roy Cuenca on 10/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    @State private var pokemonToSearch = ""
        
    private let numberOfColums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: numberOfColums) {
                    ForEach(viewModel.filteredValues, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonCellView( pokemon: pokemon, viewModel: viewModel)
                        }
                    }
                }.padding(20)
            }
            .onChange(of: pokemonToSearch, perform: {newValue in
                withAnimation{
                    viewModel.filterPokemon(name: newValue)
                }
            })
            .searchable(text: $pokemonToSearch, prompt: "Search Pokemon")
            .navigationBarTitle("Pokedex", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
