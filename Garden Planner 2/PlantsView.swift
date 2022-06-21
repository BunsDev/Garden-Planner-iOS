//
//  PlantsView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import SwiftUI

struct PlantsView_Preview: PreviewProvider {
    static var previews: some View {
        PlantsView()
            .environmentObject(Global())
    }
}

struct PlantsView: View {
    
    @EnvironmentObject var gl: Global
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar()
                Spacer()
            }
            .navigationTitle("Plants")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu() {
                        Button(action: {
                            //create new array
                        }) {
                            Text("Create new folder")
                            Image(systemName: "folder.badge.plus")
                        }
                        Button(action: {
                            //delete array
                        }) {
                            Text("Delete a folder")
                            Image(systemName: "trash")
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct CreateFormView: View {
    @State var name = ""
    var body: some View {
        Form {
            TextField("Name", text: $name)
        }
    }
}
