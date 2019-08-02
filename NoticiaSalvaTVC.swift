//
//  NoticiaSalvaTVC.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 02/08/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NoticiaSalvaTVC: UITableViewController{
    
    var reportagemSalva: New!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = reportagemSalva.titulo
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        
        if section == 1{
            return 0
        }
        
        if section == 2{
            return 0
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view : UIView = UIView(frame: CGRect.zero)
            return view
            
        }
        
        let label2 = UILabel()
        label2.text = " "
        label2.backgroundColor = UIColor.lightGray
        return label2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return 1
        }
        if section == 2 {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cellImagemNoticiaSalva", for: indexPath) as? NoticiaSalvaImagemCell {
        
                
                // colocar onde vc quer recuperar a imagem
                if let image = getSavedImage(named: reportagemSalva.imagem2) {
                    cell.imagemNoticiaSalva.image = image
                }
                
                return cell
            }
            
        }
        
        if indexPath.section == 1{
            if let cell1 = tableView.dequeueReusableCell(withIdentifier: "tituloSalvo", for: indexPath) as? NoticiaSalvaTituloCell{
                cell1.tituloNoticiaSalva.text = reportagemSalva.subtitulo
                cell1.tituloNoticiaSalva.font = UIFont(name: "Papyrus", size: 28)
                return cell1
            }
        }
        
        
        if indexPath.section == 2 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "conteudoSalvo", for: indexPath) as? NoticiaSalvaConteudoCell {
                
                cell2.conteudoNoticiaSalva.text = reportagemSalva.texto
                cell2.conteudoNoticiaSalva.font = UIFont(name: "Anonymous Pro", size: 20)
                return cell2
            }
        }
        return UITableViewCell()
        
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }

    
}
