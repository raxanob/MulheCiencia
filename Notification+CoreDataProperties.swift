//
//  Notification+CoreDataProperties.swift
//  ChellengeFerias
//
//  Created by Rayane Xavier on 28/07/19.
//  Copyright © 2019 Rayane Xavier. All rights reserved.
//

import Foundation
import CoreData


extension Plant {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: "Plant")
    }
    
    @NSManaged public var notificationPeriod: Int32
    @NSManaged public var notificationInterv: String?
    @NSManaged public var notificationTime: NSDate?
    @NSManaged public var nextNotificationTime: NSDate?
}
