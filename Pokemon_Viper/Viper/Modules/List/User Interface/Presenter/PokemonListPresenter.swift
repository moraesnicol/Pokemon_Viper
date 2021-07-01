//
//  PokemonListPresenter.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 01/07/21.
//

import Foundation


protocol PokemonListPresenterInput {
    var pokemonCount: Int { get }
    var sortOptions: [String] { get }
    var title: String { get }
    
    func viewDidLoad()
    func didSelectCell(at index: Int)
    func sortBy(selectedIndex: Int)
    func getPokemon(at index: Int) -> PokemonListItemViewModel
}

protocol PokemonListPresenterOutput: AnyObject {
    func updateUIList()
    func updateUISortOptions()
    func presentLoading()
}

class PokemonListPresenter: PokemonListPresenterInput {
    
    weak var output: PokemonListPresenterOutput?
    var interactor: PokemonListInteractorInput
    var router: PokemonListRouter
    
    
    var pokemonCount: Int {
       
    }
    
    var sortOptions: [String] {
        
    }
    
    var title: String {
        return "Pokemon List"
    }
    
    
    private var viewModel: [PokemonListItemViewModel] = [] {
        didSet {
            output?.updateUIList()
        }
    }
    
    private var sortOptions: [SortType] = [] {
        didSet {
            output?.updateUISortOptions()
        }
    }
    
    private var sortedBy: SortType = .alphabetically {
        didSet {
            viewModel = sortPokemon(pokemons: viewModel)
        }
    }
    
    init(interactor: PokemonListInteractorInput, router: PokemonListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    
    
    func viewDidLoad() {
        <#code#>
    }
    
    func didSelectCell(at index: Int) {
        <#code#>
    }
    
    func sortBy(selectedIndex: Int) {
        <#code#>
    }
    
    func getPokemon(at index: Int) -> PokemonListItemViewModel {
        <#code#>
    }
}

extension PokemonListPresenter {
    
    
    
    
    
    
    
}


extension PokemonListPresenter: PokemonLisInteractorOutput {
 
    
    
}
