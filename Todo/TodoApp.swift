//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 羅子淵 on 2024/5/3.
//

import SwiftUI

@main
struct ToDoListApp: App {
    let persistence = Persistance.share
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
