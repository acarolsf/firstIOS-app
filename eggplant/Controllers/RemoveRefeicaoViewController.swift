//
//  RemoveRefeicaoViewController.swift
//  eggplant
//
//  Created by macmini on 09/04/20.
//  Copyright © 2020 BoraLogo. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    // MARK: - Atributos
    
    let controller: UIViewController
    
    // MARK: - Init
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    // MARK: - Métodos
    
    func exibe(_ refeicao: Refeicao, hander: @escaping (UIAlertAction) -> Void) {
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
            
            let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        
            let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: hander)
            
            alerta.addAction(botaoCancelar)
            alerta.addAction(botaoRemover)
            
        controller.present(alerta, animated: true, completion: nil)
    }
}
