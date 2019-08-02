//
//  PermanenceService.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 01/08/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import CoreData

//static var context: NSManagedObjectContext{
//    return persistentContainer.viewContext
//}

import Foundation
import UIKit
import CoreData


func findAllNews() -> [New]? {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NewsSave")
    
    
    do {
        let result = try managedContext.fetch(fetchRequest)
        var news = [New]()
        
        for data in result as! [NSManagedObject] {
            let id = data.value(forKey: "id") as? String ?? ""
            let titulo = data.value(forKey: "titulo") as? String ?? ""
            let subtitulo = data.value(forKey: "subtitulo") as? String ?? ""
            let texto = data.value(forKey: "texto") as? String ?? ""
            let imagem = data.value(forKey: "imagem") as? String ?? ""
            let imagem2 = data.value(forKey: "imagem2") as? String ?? ""
            

            let new = New(_id: id, titulo: titulo, subtitulo: subtitulo, texto: texto, imagem: imagem, imagem2: imagem2)
            news.append(new)
        }
        return news
        
    } catch {
        print("Failed")
        return nil
    }
}



func findNewById(_ id:String) -> New?{
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NewsSave")
    
    
    fetchRequest.predicate = NSPredicate(format: "id = %@", id)
    do {
        let result = try managedContext.fetch(fetchRequest)
        
        if(result.count != 0){
            let data = result[0] as! NSManagedObject
            
            let id = data.value(forKey: "id") as? String ?? ""
            let titulo = data.value(forKey: "titulo") as? String ?? ""
            let subtitulo = data.value(forKey: "subtitulo") as? String ?? ""
            let texto = data.value(forKey: "texto") as? String ?? ""
            let imagem = data.value(forKey: "imagem") as? String ?? ""
            let imagem2 = data.value(forKey: "imagem2") as? String ?? ""
            
            
            let new = New(_id: id, titulo: titulo, subtitulo: subtitulo, texto: texto, imagem: imagem, imagem2: imagem2)
            return new
        } else {
            return nil
        }
        
    } catch {
        print("Failed")
        return nil
    }
}
