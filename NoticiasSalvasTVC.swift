//
//  NoticiasSalvasTVC.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 02/08/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NoticiasSalvasTVC: UITableViewController{
    
    var noticiasSalva = [New]()
    
    override func viewDidLoad() {
        noticiasSalva = findAllNews() ?? []
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        noticiasSalva = findAllNews() ?? []
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticiasSalva.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "favoritoCardCell") as? NoticiasSalvasCellCard{

            
            // colocar onde vc quer recuperar a imagem
            if let image = getSavedImage(named: noticiasSalva[indexPath.row].imagem) {
                cell.imagemCardNoticiaSalva.image = image
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let noticiaSalva = noticiasSalva[indexPath.row]
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoticiaSalvaTVC") as? NoticiaSalvaTVC {
            viewController.reportagemSalva = noticiaSalva
            
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    

}
