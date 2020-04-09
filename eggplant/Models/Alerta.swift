//
//  Alerta.swift
//  eggplant
//
//  Created by macmini on 09/04/20.
//  Copyright © 2020 BoraLogo. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(title: String = "Atenção", message: String) {
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alerta.addAction(ok)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}
