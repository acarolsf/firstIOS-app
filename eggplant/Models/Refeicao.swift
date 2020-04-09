//
//  Refeicao.swift
//  eggplant
//
//  Created by macmini on 08/04/20.
//  Copyright © 2020 BoraLogo. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    
    // MARK: - Atributos
     let nome: String
     let felicidade: Int
     var itens: Array<Item> = []

     // MARK: - Construtor
    init(nome: String, felicidade: Int, itens: [Item] = []) {
       self.nome = nome;
       self.felicidade = felicidade
        self.itens = itens
     }

    // MARK: - Metodos
     func totalDeCalorias() -> Double {
       var total = 0.0
       for item in itens {
         total += item.calorias
       }
        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - Calorias: \(item.calorias)"
        }
        
        return mensagem
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        felicidade = coder.decodeInteger(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as! Array<Item>
    }
}
