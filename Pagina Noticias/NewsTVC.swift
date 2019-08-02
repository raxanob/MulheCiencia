//
//  NewsTVC.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit

class NewsTVC: UITableViewController {
    
    var noticias: [New] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        noticias = InternNew.getAllNew()
        
//        for noticia in noticias{
//            noticia.create()
//        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return noticias.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "imagemCard") as? NewsCellCard{
            
//            cell.imagemCardNews.image = UIImage(named: "news")
            
            cell.imagemCardNews.imageFromServerURL(urlString: "https://br-mulheres-na-ciencia.herokuapp.com/imagens/\(noticias[indexPath.row].imagem)") { (s, err) in
                if (err != nil){
                    print("Erro em baixar a imagem.")
                } else{
                    if let data = cell.imagemCardNews.image?.pngData() {
                        let filename = self.getDocumentsDirectory().appendingPathComponent(self.noticias[indexPath.row].imagem)
                        try? data.write(to: filename)
                    }
                }
            }
        
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let noticia = noticias[indexPath.row]
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Noticias") as? NoticiaTVC {
            viewController.reportagem = noticia
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}




extension UIImageView {
    public func imageFromServerURL(urlString: String, completion: @escaping (String?, Error?) -> Void) {
        self.image = nil
        print(urlString)
        let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
        URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error as Any)
                completion(nil, error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                if ((self.animationImages) != nil) {
                    self.animationImages?.removeAll()
                }
                self.image = image
                completion("1", nil)
            })
            
        }).resume()
    }}
