//
//  ContentView.swift
//  ToDoey
//
//  Created by AlecNipp on 2/28/22.
//

import SwiftUI

struct ContentView: View {
    @State var currentEntry = "" // Holds the String content of the text field
    @State var todolist: [ToDo] = [] // List of custom data type ToDo
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        TextField("Enter Text", text: $currentEntry, prompt: Text("Enter a task"))
                            .onSubmit() {
                                todolist.append(ToDo(content: currentEntry))
                                currentEntry = ""
                            }
                    }
                    Section {
                        ForEach($todolist) { $todo in
                            ToDoView(todo: $todo)
                        }
                        
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle(Text("ToDoey"))
        }
    }
}

struct ToDo: Identifiable {
    let id = UUID()
    let content: String
    var completed = false
}

struct ToDoView: View {
    @Binding var todo: ToDo
    var body: some View {
        Button {
            todo.completed.toggle()
        } label: {
            HStack {
                Image(systemName: todo.completed ?  "circle.fill": "circle")
                    .foregroundColor(.blue)
                Text(todo.content)
            }
        }
        .buttonStyle(.plain)
    }
}


struct ToDoey_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
