//
//  NavBar.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/22/22.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 60)
                .foregroundColor(.white)
            HStack {
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "leaf")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "grid")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "calendar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
            }.foregroundColor(.accentColor)
                .frame(height: 26)
        }
    }
}
