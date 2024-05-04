//
//  PageView2.swift
//  ToDoList
//
//  Created by 羅子淵 on 2024/5/3.
//

import SwiftUI
    
struct PageView2: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var context
    @State var text = ""
    var body: some View {
        VStack{
            Form{
                TextField("to do ...... ", text: $text)
                
            }
            Button("Add", action: {
                let todo = Todo(context: self.context)
                todo.text = self.text
                
                do {
                    try self.context.save()
                } catch  {
                    let error = error as? Error
                    print(error)
                }
                self.presentationMode.wrappedValue.dismiss()
            })
        }
        }
        
}

#Preview {
    PageView2()
}
