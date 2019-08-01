//
//  News.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit

struct New: Codable {
    var _id: String
    var titulo: String
    var subtitulo: String
    var texto: String
    var imagem: String
    var imagem2: String
    
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
