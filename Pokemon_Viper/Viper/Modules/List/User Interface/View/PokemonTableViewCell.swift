//
//  PokemonTableViewCell.swift
//  Pokemon_Viper
//
//  Created by Gabriel on 01/07/21.
//

import UIKit


class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var display: PokemonListItemViewModel?
    
    func setUp() {
        guard let display = self.display else { return }
        
        idLabel.text = "\(display.id)"
        pokemonNameLabel.text = display.name
    }
    
}
