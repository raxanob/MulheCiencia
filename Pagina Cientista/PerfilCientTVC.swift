//
//  PerfilCientTVC.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit

class PerfilCientTVC: UITableViewController {
    
    var perfil: Carreira!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = perfil.nome
        //        navigationController?.navigationBar.isHidden = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
            label1.text = "    Instituições"
            label1.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
            label1.font = UIFont.boldSystemFont(ofSize: 28.0)
            label1.backgroundColor = #colorLiteral(red: 0.5293574929, green: 0.5294498801, blue: 0.529345274, alpha: 1)
            return label1
        }
        
        if section == 2 {
            let label2 = UILabel()
            label2.text = "    Trabalhos"
            label2.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 1)
            label2.font = UIFont(name: "Papyrus", size: 28)
            label2.backgroundColor = #colorLiteral(red: 0.5293574929, green: 0.5294498801, blue: 0.529345274, alpha: 1)
            return label2
        }
        
        let label3 = UILabel()
        label3.text = " "
        label3.backgroundColor = UIColor.lightGray
        return label3
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return perfil.instituicoes.count
        }
        if section == 2 {
            return perfil.trabalhos.count
        }
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "FotoCientista", for: indexPath) as? PerfilCientCellImagem {
                cell.ImagemPerfil.image = UIImage(named: perfil.nomedaimagem)
                return cell
            }
            
        }
        
        if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "Instituições", for: indexPath) as? PerfilCientCellLabel {
                
                cell2.LabelPerfil.text = perfil.instituicoes
                cell2.LabelPerfil.font = UIFont(name: "Anonymous Pro", size: 20)
                return cell2
            }
        }
        
        if indexPath.section == 2 {
            if let cell3 = tableView.dequeueReusableCell(withIdentifier: "Trabalhos", for: indexPath) as? PerfilCientCellLabel {
                
                cell3.LabelPerfil.text = perfil.instituicoes
                cell3.LabelPerfil.font = UIFont(name: "Anonymous Pro", size: 20)
                return cell3
            }
        }
        return UITableViewCell()
    }
}
