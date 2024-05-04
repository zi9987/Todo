//
//  Persistance.swift
//  ToDoList
//
//  Created by 羅子淵 on 2024/5/3.
//

import CoreData

struct Persistance{
    static let share = Persistance()
    
    var container:NSPersistentContainer
    
    init(){
        container=NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as? NSError{
                print(error)
            }
            
        })
        
    }
    
}
