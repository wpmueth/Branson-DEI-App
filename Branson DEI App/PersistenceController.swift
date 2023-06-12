//
//  PersistenceController.swift
//  Branson DEI App
//
//  Created by William Mueth on 6/11/23.
//

import CoreData

class PersistenceController {
    static let shared = PersistenceController()

    // This is your Persistent Container.
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "BransonDEI")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
