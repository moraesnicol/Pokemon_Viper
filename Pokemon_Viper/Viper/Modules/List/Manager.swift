//
//  Manager.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 29/06/21.
//

import UIKit

protocol PokemonListManagerInput {
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ())
}

class PokemonListManager: PokemonListManagerInput {
    
    var objects: [PokemonAPIModel] = []
    
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ()) {
        PokemonAPI.shared.getPokemons {
            objects in
            
            self.objects = objects
            completion(self.objects)
        }
    }
}
