//
//  ContentView.swift
//  ToDoList
//
//  Created by 羅子淵 on 2024/5/3.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [])
    var todos: FetchedResults<Todo>
    @Environment(\.managedObjectContext) var context
    var body: some View {
        
        NavigationView{
           
            List{
                ForEach(todos){item in
                    Text(item.text ?? "")
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("To Do List")
            .toolbar(content: {
                ToolbarItem( placement: .navigationBarTrailing, content:{
                    NavigationLink("Add", destination: {
                        PageView2()
                    })
                })
            })
        }
      
    }
    func delete(offsets: IndexSet){
        if let index = offsets.first{
            let todo = todos[index]
            self.context.delete(todo)
            
            do {
                try self.context.save()
            } catch  {
                let error = error as? Error
            }
            
        }
    }
    
    struct ContentView_Previews:PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
}
