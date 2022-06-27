//
//  TasksAndNotifsView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/23/22.
//

import SwiftUI

struct TasksAndNotifs_Preview: PreviewProvider {
    static var previews: some View {
        TasksAndNotifsView()
            .environmentObject(Global())
    }
}

struct TasksAndNotifsView: View {
    
    @EnvironmentObject var gl: Global
    @ObservedObject var m = Messages()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 35)
                    .fill(Color.darkGreen)
                    .ignoresSafeArea()
                    .padding(.top, 160)
            }
            
            VStack(alignment: .leading) {
                
                //MARK: - Button
                HStack {
                    Spacer()
                    Button(action: {
                        //gl.view = "Settings"
                    }) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 27)
                    }.foregroundColor(.darkGreen)
                        .padding(.top, 20)
                        .padding(.bottom, -5)
                }.padding([.leading, .trailing], 25)
                
                
                //MARK: - Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("Tasks & Notifications")
                            .font(.custom("Inter-Bold", size: 40))
                    }.foregroundColor(.darkGreen)
                        .padding(.top, -5)
                    Spacer()
                }.padding([.leading, .trailing], 25)
                
                
                //MARK: - Alerts
                VStack(alignment: .leading) {
                    Text("Notifications")
                        .font(.custom("Inter-SemiBold", size: 22))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                        .padding(.leading, 25)
                    ForEach(m.notifs, id: \.self) { notif in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(height: 50)
                            HStack {
                                if notif.priority == 1 {
                                    Image(systemName: "exclamationmark.triangle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 22)
                                        .foregroundColor(.redish)
                                        .padding(.trailing, 5)
                                }
                                Text(notif.memo)
                                    .font(.custom("Inter-Medium", size: 18))
                                Spacer()
                            }.padding([.leading, .trailing], 20)
                        }.padding([.leading, .trailing], 25)
                    }
                    
                    Text("Tasks")
                        .font(.custom("Inter-SemiBold", size: 22))
                        .foregroundColor(.white)
                        .padding(.leading, 25)
                        .padding(.top, 10)
                    ForEach(m.tasks, id: \.self) { task in
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(height: 50)
                            HStack {
                                if task.priority == 1 {
                                    Image(systemName: "exclamationmark.triangle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 22)
                                        .foregroundColor(.redish)
                                        .padding(.trailing, 5)
                                }
                                Text(task.memo)
                                    .font(.custom("Inter-Medium", size: 18))
                                Spacer()
                                Button(action: {
                                    let i = m.tasks.firstIndex(where: {$0 == task})
                                    m.tasks[i!].selected.toggle()
                                }) {
                                    Image(systemName: task.selected ? "checkmark.circle" : "circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 20)
                                        .foregroundColor(.darkGreen)
                                }
                                
                            }.padding([.leading, .trailing], 20)
                        }.padding([.leading, .trailing], 25)
                    } //end foreach
                } //end vstack
                Spacer()
            }
            
            //MARK: - NavBar
            NavBarTN()
        } //end zstack
    }
}


struct notif: Hashable {
    var memo: String
    var priority: Int
    var selected: Bool
}

struct task: Hashable {
    var memo: String
    var priority: Int
    var selected: Bool
}

class Messages: ObservableObject {
    @Published var notifs = [notif(memo: "Heat wave coming!", priority: 1, selected: false)]
    @Published var tasks = [notif(memo: "Water Garden Bed 1", priority: 0, selected: false)]
}

