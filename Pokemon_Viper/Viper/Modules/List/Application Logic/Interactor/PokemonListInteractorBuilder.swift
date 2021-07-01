//
//  Interactor.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 29/06/21.
//

import Foundation

class PokemonListInteractorBuilder {
    
    static func make(manager: PokemonListManagerInput) -> PokemonListInteractor {
     
        return PokemonListInteractor(manager: manager)
        
    }
}


