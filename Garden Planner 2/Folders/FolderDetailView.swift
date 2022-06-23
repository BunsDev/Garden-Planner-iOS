//
//  FolderDetailView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/22/22.
//

import SwiftUI

struct FolderDetail_Preview: PreviewProvider {
    static var previews: some View {
        FolderDetailView()
            .environmentObject(Global())
    }
}

struct FolderDetailView: View {
    @EnvironmentObject var gl: Global
    var body: some View {
        VStack {
            Button(action: {
                gl.view = "PlantsView"
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            }
        }
    }
}
