//
//  PokemonListPresentBuilder.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 01/07/21.
//

import Foundation


class PokemonListPresenterBuilder {
    
    static func make(interactor: PokemonListInteractorInput, router: PokemonListRouter) -> PokemonListPresenter{
        let presenter = PokemonListPresenter(interactor: interactor, router: router)
    
    return presenter
    }
}
