//
//  ViewController.swift
//  eggplant
//
//  Created by macmini on 08/04/20.
//  Copyright © 2020 BoraLogo. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add (_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItensDelegate {
    
    // MARK: - IBOutlets
    
    
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - Atributos

    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [
                        Item(nome: "Molho de Tomate", calorias: 40.0),
                        Item(nome: "Queijo", calorias: 40.0),
                        Item(nome: "Molho Apimentado", calorias: 40.0),
                        Item(nome: "Requeijão", calorias: 40.0),
                        Item(nome: "Suco", calorias: 40.0)
    ]
    var itensSelecionados: [Item] = []
    
//    var itens: [String] = ["Molho de tomate", "Queijo", "Molho Apimentado", "Requeijão"]

    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTxt: UITextField?
    
    @IBOutlet weak var felicidadeTxt: UITextField?
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        let botaoAddItem = UIBarButtonItem(title: "Add Item", style: .plain, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = botaoAddItem
    }
    
    @objc func addItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add (_ item: Item) {
        itens.append(item)
        itensTableView?.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
            
        }        
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTxt?.text else {
            return
        }
        guard let felicidadeDaRefeicao = felicidadeTxt?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }

        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade:felicidade, itens: itensSelecionados)
        
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
}

