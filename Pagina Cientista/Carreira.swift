//
//  Carreira.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 19/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.


import Foundation
import UIKit

struct Carreira: Codable {
    var palavraschave: [String]
    var area: String
    var nomedaimagem: String
    var nome: String
    var especializacao: String
    var instituicoes: String
    var trabalhos: String
    
}

class InternCientistas: NSObject {
    static func getAllCarreiras() -> [Carreira] {
        var carreiras: [Carreira] = []
        do {
            if let path = Bundle.main.path(forResource: "test2", ofType: "json", inDirectory: nil)
            {
                let url = URL(fileURLWithPath: path)
                let carreirasData = try Data(contentsOf: url)
                carreiras = try JSONDecoder().decode([Carreira].self, from: carreirasData)
                return carreiras
            }
        } catch {
            print("\(error.localizedDescription)")
            
        }
        return carreiras
    }
}
