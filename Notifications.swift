//
//  Notifications.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 29/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import UIKit

struct Notification: Codable {
    var titulo: String
    var descricao: String
}

class InternNotif: NSObject {
    static func getAllNotif() -> [Notification] {
        var curiosidade: [Notification] = []
        do {
            if let path = Bundle.main.path(forResource: "Notifications", ofType: "json", inDirectory: nil)
            {
                let url = URL(fileURLWithPath: path)
                let curiosidadeData = try Data(contentsOf: url)
                curiosidade = try JSONDecoder().decode([Notification].self, from: curiosidadeData)
                return curiosidade
            }
        } catch {
            print("Erro")
        }
        return curiosidade
    }
}
