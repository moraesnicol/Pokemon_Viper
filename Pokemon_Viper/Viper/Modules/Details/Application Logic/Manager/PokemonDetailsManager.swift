//
//  PokemonDetailsManager.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 01/07/21.
//

import Foundation

protocol PokemonDetailsManagerInput {
    func getPokemonDetails(id: String, completion: @escaping ((PokemonDetailsAPIModel) -> ()))
}


class PokemonDetailsManager: PokemonListManagerInput {
    
    
    var object: PokemonDetailsAPIModel?
    
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ()) {
        PokemonAPI.shared.getPokemons(id: id) {
            pokemon in
            
            self.object = pokemon
            guard let object = self.object else { return }
            completion
            
        }
    }
}
