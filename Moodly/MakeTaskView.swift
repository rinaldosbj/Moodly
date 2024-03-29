//
//  MakeTaskView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 27/05/23.
//

import SwiftUI

struct MakeTaskView: View {
    
    @Environment(\.dismiss) var presentation
    
    @Binding var tasks: [Task]
    @State var taskName = ""
    var currentDate: Date
    
    @AppStorage("names") var namessStored : [String] = ["Teste Persistencia"]
    @AppStorage("isCompleteds") var isCompletedsStored : [Bool] = [false]
    @AppStorage("isDeleteds") var isDeletedsStored : [Bool] = [false]
    @AppStorage("creationDates") var creationDatesStored : [Date] = [Date()]
    
    var body: some View {
        ZStack {
            
            Rectangle().foregroundColor(Color("papel20"))
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentation.callAsFunction()
                    } label: {
                        Text("X")
                            .font(.title)
                            .bold()
                            .foregroundColor(.gray)
                    }.buttonStyle(.borderless)
                }.padding()
                Spacer()
            }
            
            VStack {
                Text("Nova Tarefa")
                    .font(.custom("PumpkinCheesecakeRegular", size: 40))
                    .foregroundColor(.black)
                Spacer()
                TextField("escreva o nome da tarefa...", text: $taskName)
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding()
                    .border(Color(white: 0.9),width: 1)
                    .frame(width: 300,height: 50)
                    .textFieldStyle(.plain)
                    .preferredColorScheme(.light)
                    .onSubmit {
                        // Pra quando a pessoa apertar enter
                        if taskName != "" {
                            presentation.callAsFunction()
                            tasks.append(Task(name: taskName,creationDate: currentDate, index: tasks.count))
                            namessStored.append(taskName)
                            isDeletedsStored.append(false)
                            isCompletedsStored.append(false)
                            creationDatesStored.append(currentDate)
                        }
                    }
                Spacer()
                Button(action: {
                    if taskName != "" {
                        presentation.callAsFunction()
                        tasks.append(Task(name: taskName,creationDate: currentDate, index: tasks.count))
                        namessStored.append(taskName)
                        isDeletedsStored.append(false)
                        isCompletedsStored.append(false)
                        creationDatesStored.append(currentDate)
                    }
                }, label: {
                    ZStack {
                        Rectangle().foregroundColor(Color("madeira100")).frame(width: 200,height: 50)
                            .cornerRadius(15)
                        Text("Ok")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                }).buttonStyle(.borderless)
            }.padding(40)
        }
        .frame(width: 500,height: 400)
        
    }
}

