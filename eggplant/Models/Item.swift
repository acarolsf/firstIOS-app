//
//  Item.swift
//  eggplant
//
//  Created by macmini on 08/04/20.
//  Copyright © 2020 BoraLogo. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    
    // MARK: - Atributos
    
    var nome: String
    var calorias: Double
    
    // MARK: - Construtor

    init(nome: String, calorias:Double) {
      self.nome = nome
      self.calorias = calorias
    }
    
    // MARK: NSCode
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
    
}
