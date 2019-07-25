//
//  NoticiaTVC.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit

class NoticiaTVC: UITableViewController{
    
    var reportagem: New!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = reportagem.titulo
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 40
       }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view : UIView = UIView(frame: CGRect.zero)
            return view
            
        }
        if section == 1 {
            let label1 = UILabel()
            label1.text = "      \(reportagem.titulo)"
            label1.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
            label1.font = UIFont(name: "Papyrus", size: 28)
            label1.lineBreakMode = NSLineBreakMode.byWordWrapping
            label1.backgroundColor = #colorLiteral(red: 0.2128753066, green: 0.2072399855, blue: 0.2334718406, alpha: 1)
            label1.numberOfLines = 0
            
            label1.translatesAutoresizingMaskIntoConstraints = false
            label1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
            label1.heightAnchor.constraint(equalToConstant: tableView.sectionHeaderHeight).isActive = true

            
            return label1
            
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
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ImagemPessoa", for: indexPath) as? NoticiaCellFoto {
                cell.ImagemNoticia.image = UIImage(named: reportagem.imagem)
                return cell
            }
            
        }
        if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "Conteudo", for: indexPath) as? NoticiaConteudoCell {

                cell2.ConteudoNoticia.text = reportagem.texto
                cell2.ConteudoNoticia.font = UIFont(name: "Anonymous Pro", size: 20)
                return cell2
            }
        }
        return UITableViewCell()

    }
    
}
