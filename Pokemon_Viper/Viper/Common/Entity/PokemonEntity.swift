//
//  PokemonEntity.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 30/06/21.
//

import Foundation

struct PokemonsEntity {
    
    var name: String = ""
    var pokemonURL: String = ""
    var id: Int = 0
    
    init(name: String, pokemonUrl: String) {
        self.name = name
        self.pokemonURL = pokemonUrl
        self.id = Int(pokemonURL.split(separator: "/", maxSplits: 10, omittingEmptySubsequences: true)[5])!
    }
    
}
