//
//  Item.swift
//  eggplant
//
//  Created by macmini on 08/04/20.
//  Copyright © 2020 BoraLogo. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    // MARK: - Atributos
    
    var nome: String
    var calorias: Double
    
    // MARK: - Construtor

    init(nome: String, calorias:Double) {
      self.nome = nome
      self.calorias = calorias
    }
}
