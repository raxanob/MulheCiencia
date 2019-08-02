//
//  News.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit
import CoreData
struct New: Codable {
    var _id: String
    var titulo: String
    var subtitulo: String
    var texto: String
    var imagem: String
    var imagem2: String
    
    public func create(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "NewsSave" , in: managedContext)!
        
        let news = NSManagedObject(entity: userEntity, insertInto: managedContext)
        
        news.setValue(self._id, forKeyPath: "id")
        news.setValue(self.titulo, forKeyPath: "titulo")
        news.setValue(self.subtitulo, forKeyPath: "subtitulo")
        news.setValue(self.texto, forKeyPath: "texto")
        news.setValue(self.imagem, forKeyPath: "imagem")
        news.setValue(self.imagem2, forKeyPath: "imagem2")
        
        
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    
    func update(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Carts")
        
        fetchRequest.predicate = NSPredicate(format: "id = %@", self._id)
        
        do {
            let test = try managedContext.fetch(fetchRequest)
            if(test.count != 0){
                let news = test[0] as! NSManagedObject
                
                news.setValue(self._id, forKeyPath: "id")
                news.setValue(self.titulo, forKeyPath: "titulo")
                news.setValue(self.subtitulo, forKeyPath: "subtitulo")
                news.setValue(self.texto, forKeyPath: "texto")
                news.setValue(self.imagem, forKeyPath: "imagem")
                news.setValue(self.imagem2, forKeyPath: "imagem2")
                
            } else {
                print("Object not found")
            }
            
            do {
                try managedContext.save()
            }
            catch let error as NSError {
                print(error)
            }
        }
        catch {
            print(error)
        }
    }
    
    
    func delete(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Carts")
        
        fetchRequest.predicate = NSPredicate(format: "id = %@", self._id)
        
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            if(test.count != 0){
                let objectToDelete = test[0] as? NSManagedObject
                
                if(objectToDelete != nil){
                    managedContext.delete(objectToDelete!)
                    do{
                        try managedContext.save()
                    }
                    catch
                    {
                        print(error)
                    }
                }
            }
            else {
                print("Object not found")
            }
        }
        catch
        {
            print(error)
        }
    }
    
    
}

class InternNew: NSObject {
    static func getAllNew() -> [New] {
        var noticias: [New] = []
        do {
             let path = "https://br-mulheres-na-ciencia.herokuapp.com/api/noticias"
            
                let url2 = URL(string: path)
                let noticiasData = try Data(contentsOf: url2 as! URL)
                noticias = try JSONDecoder().decode([New].self, from: noticiasData)
                return noticias

        } catch {
            print("\(error.localizedDescription)")
            
        }
        return noticias
    }
}
