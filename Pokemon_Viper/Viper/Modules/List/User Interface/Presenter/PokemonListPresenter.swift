//
//  PokemonListPresenter.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 01/07/21.
//

import Foundation


protocol PokemonListPresenterInput {
    var pokemonCount: Int { get }
    var sortOptionsModel: [String] { get }
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
        return viewModel.count
    }
    
    var sortOptionsModel: [String] {
        return sortOptionsToString(options: sortOptions)
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
        output?.presentLoading()
        DispatchQueue(label: "Fetch Pokemon").async {
            self.interactor.fetch()
        }
        DispatchQueue(label: "Find Sort options").async {
            self.interactor.findSortOptions()
        }
    }
    
    func didSelectCell(at index: Int) {
        let pokemon = viewModel[index]
        let id = pokemon.id
        
        router.presentDetails(id)
    }
    
    func sortBy(selectedIndex: Int) {
        sortedBy = sortOptions[selectedIndex]
    }
    
    func getPokemon(at index: Int) -> PokemonListItemViewModel {
        return viewModel[index]
        
    }
}

extension PokemonListPresenter {
    
    private func sortOptionsToString(options: [SortType]) -> [String] {
        
        var sortOptions = [String]()
        
        for option in options {
            sortOptions.append(option.rawValue)
        }
        return sortOptions
    }
    
    private func sortPokemon(pokemons: [PokemonListItemViewModel]) -> [PokemonListItemViewModel] {
        
        switch sortedBy {
        case .alphabetically: return pokemons.sorted(by: {$0.name < $1.name})
        case .byId: return pokemons.sorted(by: {$0.id < $1.id})
       
        }
    }
}


extension PokemonListPresenter: PokemonListInteractorOutput {
   
    
    func fetched(pokemons: [PokemonEntity]) {
        self.viewModel = PokemonMapper.parse(from: pokemons)
    }
    
    func foundSortOptions(_ options: [SortType]) {
        self.sortOptions = options
    }
    
    
    
}
