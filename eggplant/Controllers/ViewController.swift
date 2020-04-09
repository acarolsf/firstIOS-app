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
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    

    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTxt: UITextField?
    
    @IBOutlet weak var felicidadeTxt: UITextField?
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        let botaoAddItem = UIBarButtonItem(title: "Add Item", style: .plain, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = botaoAddItem
        
        itens = ItemDao().recupera()
    }
    
    @objc func addItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add (_ item: Item) {
        itens.append(item)
        // itensTableView?.reloadData()
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(title: "Desculpe", message: "Não foi possível atualizar a tabela")
        }
        ItemDao().save(itens)
        
    }
    
    func recuperaRefeicaoDoForm() -> Refeicao? {
        guard let nomeDaRefeicao = nomeTxt?.text else { return nil }
        guard let felicidadeDaRefeicao = felicidadeTxt?.text, let felicidade = Int(felicidadeDaRefeicao) else { return nil }

        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade:felicidade, itens: itensSelecionados)
        
        return refeicao;
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
        
        if let refeicao = recuperaRefeicaoDoForm() {
        
            delegate?.add(refeicao)
        
            navigationController?.popViewController(animated: true)
        } else {
            Alerta(controller: self).exibe(message: "Erro ao ler dados do formulário")
        }
    }
    
    
    
}

