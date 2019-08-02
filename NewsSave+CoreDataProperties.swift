//
//  NewsSave+CoreDataProperties.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 02/08/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//
//

import Foundation
import CoreData


extension NewsSave {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsSave> {
        return NSFetchRequest<NewsSave>(entityName: "NewsSave")
    }

    @NSManaged public var titulo: String?
    @NSManaged public var subtitulo: String?
    @NSManaged public var texto: String?
    @NSManaged public var imagem2: String?
    @NSManaged public var id: String?
    @NSManaged public var imagem: String?

}
