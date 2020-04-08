//
//  AdicionarItensViewController.swift
//  eggplant
//
//  Created by macmini on 08/04/20.
//  Copyright © 2020 BoraLogo. All rights reserved.
//

import UIKit

protocol AddItensDelegate {
    func add (_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var nomeTxt: UITextField?
    
    @IBOutlet weak var caloriasTxt: UITextField?
    
    // MARK: Atributos
    
    var delegate: AddItensDelegate?
    
    init(delegate: AddItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        // navegar para a proxima tela: navigationController.push()
        // navegar para a tela anterior: navigationController.pop()
        
        guard let nome = nomeTxt?.text, let calorias = caloriasTxt?.text else { return }
        
        if let numeroCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    
        
    }
    
}
