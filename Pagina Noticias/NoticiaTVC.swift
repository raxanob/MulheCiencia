//
//  NoticiaTVC.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class NoticiaTVC: UITableViewController{
    
    var reportagem: New!
    var noticiaSalva = [NewsSave]()
    var hideButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = reportagem.titulo
        
        let fetchRequest:NSFetchRequest<NewsSave>
    }
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        reportagem.create()
//        let newsSave = NSEntityDescription.insertNewObject(forEntityName: "NewsSave", into: PermanenceService.context) as! NewsSave
//        newsSave.titulo = reportagem.titulo
//        newsSave.subtitulo = reportagem.subtitulo
//        newsSave.texto = reportagem.texto
//        newsSave.imagem = reportagem.imagem
//        newsSave.imagem2 = reportagem.imagem2
//        hideButton = true
//
//        PermanenceService.saveContext()
//        self.noticiaSalva.append(newsSave)
        
        tableView.reloadData()
        
        
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
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ImagemPessoa", for: indexPath) as? NoticiaCellFoto {
//                cell.ImagemNoticia.image = UIImage(named: reportagem.imagem)
                cell.ImagemNoticia.imageFromServerURL(urlString: "https://br-mulheres-na-ciencia.herokuapp.com/imagens/\(reportagem.imagem2)") { (r, erro) in
                    if (erro != nil){
                    print("Erro em baixar a imagem.")
                    } else {
                        
                        if let data = cell.ImagemNoticia.image?.pngData() {
                            let filename = self.getDocumentsDirectory().appendingPathComponent(self.reportagem.imagem2)
                            try? data.write(to: filename)
                        }
                    }
                }
                if hideButton{
                cell.savebutton.isHidden = true
                }
                
                return cell
            }
            
        }
        
        if indexPath.section == 1{
            if let cell1 = tableView.dequeueReusableCell(withIdentifier: "Titulo", for: indexPath) as? NoticiaCellTitulo{
                cell1.tituloNoticiaLabel.text = reportagem.subtitulo
                cell1.tituloNoticiaLabel.font = UIFont(name: "Papyrus", size: 28)
                return cell1
            }
        }
        
        
        if indexPath.section == 2 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "Conteudo", for: indexPath) as? NoticiaConteudoCell {

                cell2.ConteudoNoticia.text = reportagem.texto
                cell2.ConteudoNoticia.font = UIFont(name: "Anonymous Pro", size: 20)
                return cell2
            }
        }
        return UITableViewCell()

    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
