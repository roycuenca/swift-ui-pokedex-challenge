//
//  PokemonCellView.swift
//  pokedex
//
//  Created by Roy Cuenca on 10/07/2023.
//

import SwiftUI

struct PokemonCellView: View {
    
    let pokemon: PokemonModel
    let viewModel: PokemonViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(viewModel.getColorBasedOnType(type: pokemon.type))
                .cornerRadius(25)
            
            VStack {
                AsyncImage(url: URL(string: pokemon.imageUrl)) {
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                .shadow(radius: 12)
                
                Text(pokemon.name)
                    .font(.body)
                    .foregroundColor(.white)
                
            }.padding(5)
        }
    }
}
