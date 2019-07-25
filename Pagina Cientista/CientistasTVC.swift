//
//  CientistasTVC.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//


import Foundation
import UIKit

class CientistasTVC: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var carreiras: [Carreira] = []
    var filtercient: [Carreira] = []
    var fotoperfil = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = .init(red: 233/255, green: 110/255, blue: 46/255, alpha: 1)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Pesquisar cientista"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        carreiras = InternCientistas.getAllCarreiras()
        
        print(carreiras.count)
        
        tabBarController?.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.5293574929, green: 0.5294498801, blue: 0.529345274, alpha: 1)
        
        fotoperfil.layer.cornerRadius = fotoperfil.frame.height/2
        
        tableView.reloadData()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering(){
            return filtercient.count
        }
        return carreiras.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PerfilCell") as? CientistasCell {
            
            if isFiltering(){
                
                cell.fotoCientista.image = UIImage(named: filtercient[indexPath.row].nomedaimagem)
                
                cell.nomeCientista.text = filtercient[indexPath.row].nome
                cell.especializacaoCientista.text = filtercient[indexPath.row].especializacao
                
            }
            else {
                
                cell.fotoCientista.image = UIImage(named: carreiras[indexPath.row].nomedaimagem)
                
                cell.nomeCientista.text = carreiras[indexPath.row].nome
                cell.especializacaoCientista.text = carreiras[indexPath.row].especializacao
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var perfils = carreiras[indexPath.row]
        
        if isFiltering(){
            perfils = filtercient[indexPath.row]
        }
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PerfilCientista") as? PerfilCientTVC {
            viewController.perfil = perfils
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        
        filtercient = carreiras.filter({ (umaPessoa : Carreira) -> Bool in
            for palavrachave in umaPessoa.palavraschave{
                if palavrachave.lowercased().contains(searchText.lowercased()){
                    return true
                }
            }
            return false
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
}

extension CientistasTVC: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}


