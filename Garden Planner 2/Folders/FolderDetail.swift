//
//  FolderDetailView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/22/22.
//

import SwiftUI

struct FolderDetail_Preview: PreviewProvider {
    static var previews: some View {
        FolderDetail()
            .environmentObject(Global())
    }
}

struct FolderDetail: View {
    @EnvironmentObject var gl: Global
    var body: some View {
        VStack {
            Button(action: {
                gl.view = "Plants"
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            }
        }
    }
}
