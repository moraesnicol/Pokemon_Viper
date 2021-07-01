//
//  PokemonApi.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 30/06/21.
//

import Foundation
import Alamofire
import ObjectMapper


class PokemonAPI {
    
    var baseURL = "https://pokeapi.co/api/v2/pokemom/"
    static var shared: PokemonAPI = PokemonAPI()
    
    private init() { }
    
    func getPokemons(completion: @escaping ([PokemonAPIModel]) -> ()) {
        
        let pokemonURL = baseURL+"?offset=0&limit=150"
        
        request(url: pokemonURL){(json) in
            
            guard let _json = json, let pokemons =
                    Mapper<PokemonAPIModel>().mapArray(JSONObject: _json["results"]) else {
                    completion([])
                    return
        }
            completion(pokemons)
    }
 }

    func getPokemon(id: String, completion: @escaping (PokemonDetailsAPIModel) -> ()){
     
      let pokemonURL = baseURL+id
        
        request(url: pokemonURL) {
            (json) in
            
            guard let _json = json, let pokemon = Mapper<PokemonDetailsAPIModel>().
        }
        
        
    }
