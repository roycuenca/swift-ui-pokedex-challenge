//
//  NetworkManager.swift
//  pokedex
//
//  Created by Roy Cuenca on 10/07/2023.
//

import Foundation

enum APPError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {}
    
    func getListOfPokemon(completed: @escaping (Result<[PokemonModel], APPError>) -> Void) {
        guard let url = URL(string: NetworkManager.baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
                      
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
                
                guard let data = data?.parseData(removeString: "null,") else {
                    completed(.failure(.decodingError))
                    return
                }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([PokemonModel].self, from: data)
                print("pokemons here \(response.count)")
                completed(.success(response))
            } catch {
                print ("Debug: error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
                
            
        }
        task.resume()
      
    }
}
                      
extension Data {
    func parseData(removeString word: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: word, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil}
        return data
    }
}
