//
//  PokemonDetailView.swift
//  pokedex
//
//  Created by Roy Cuenca on 10/07/2023.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @State private var isAnimating = false
    
    let pokemon : PokemonModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemon.imageUrl)) {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 200)
            .shadow(radius: 12)
            .scaleEffect(isAnimating ? 1.2 : 0.7)
            .padding(30)
            
            Text(pokemon.description)
                .font(.system(size: 28))
                .lineLimit(4)
                .padding(10)
            VStack{
                Text("type: \(pokemon.type.capitalized)")
                    .font(.title2).padding(10)
                HStack{
                    Text("Attack: \(pokemon.attack)")
                        .foregroundColor(.red)
                        .bold()
                    Text("Defense: \(pokemon.defense)")
                        .foregroundColor(.green)
                        .bold()

                }
            }
            
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation{
                    isAnimating = true
                }
            }
        }
        .padding(15)
        .navigationBarTitle(pokemon.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: MockPokemon.pokemon)
    }
}
