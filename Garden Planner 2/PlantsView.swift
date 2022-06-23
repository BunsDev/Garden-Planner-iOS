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
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.green1, .green2], startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
                VStack {
                    //MARK: - Button
                    HStack {
                        Spacer()
                        Menu {
                            Button(action: {
                                gl.view = "CreateFolderView"
                            }) {
                                Text("Create new folder")
                                Image(systemName: "folder.badge.plus")
                            }
                            Button(action: {
                                
                            }) {
                                Text("Delete a folder")
                                Image(systemName: "trash")
                            }
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 23)
                        }.foregroundColor(.greenTitle)
                            .padding(.top, 20)
                    }
                    
                    //MARK: - Header
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Plants")
                                .font(.custom("Inter-Bold", size: 40))
                                .padding(.bottom, -1)
                            Text("Search the OpenFarm API for garden plants!")
                                .font(.custom("Inter-SemiBold", size: 21))
                        }.foregroundColor(.greenTitle)
                            .padding(.top, -5)
                        Spacer()
                    }
                    
                    //MARK: - Folders
                    ForEach(gl.folders, id: \.self) { folder in
                        ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 170)
                            .foregroundColor(.white)
                            .overlay(
                                VStack {
                                    HStack {
                                        Text(folder.name)
                                        Spacer()
                                        Button(action: {
                                            gl.view = "FolderDetailView"
                                        }) {
                                            Image(systemName: "chevron.right")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 15)
                                        }
                                    }
                                    Spacer()
                                }.foregroundColor(.accentColor)
                                    .font(.custom("Inter-Medium", size: 18))
                                    .padding([.leading, .trailing], 20)
                                    .padding(.top, 15)
                            )
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(folder.contents, id: \.self) { crop in
                                        AsyncImage(url: URL(string: crop.attributes.main_image_path), content: { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 125, height: 100)
                                                .cornerRadius(10)
                                        }, placeholder: {
                                            RoundedRectangle(cornerRadius: 15)
                                                .frame(width: 125, height: 100)
                                                .foregroundColor(Color("gray1"))
                                        })
                                    }
                                }.padding(.leading, 15)
                            }.padding(.top, 29)
                        }
                    }.padding(.top, 60)
                        .padding(.bottom, -50)
                    Spacer()
                    
                }.padding([.leading, .trailing], 25)
                    //end vstack
            
                //MARK: - Search Bar
             
            VStack {
                SearchBar()
                Spacer()
            }.padding(.top, 168)
            
            VStack {
                Spacer()
                NavBar()
            }.padding([.leading, .trailing], 25)
            
        } //end zstack
    }
}
