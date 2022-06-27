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
                .fill(Color.white)
            
            VStack {
                RoundedRectangle(cornerRadius: 35)
                    .fill(Color.darkGreen)
                    .ignoresSafeArea()
                    .frame(height: 240)
                Spacer()
            }
            
            VStack {
                
                //MARK: - Button
                HStack {
                    Spacer()
                    Menu {
                        Button(action: {
                            gl.view = "CreateFolderView"
                        }) {
                            Text("Create new folder")
                            Image(systemName: "plus")
                        }
                        Button(action: {
                            gl.view = "DeleteFolderView"
                        }) {
                            Text("Delete a folder")
                            Image(systemName: "trash")
                        }
                    } label: {
                        Image(systemName: "folder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 22)
                    }.foregroundColor(.lightGreenHeader)
                        .padding(.top, 20)
                }.padding([.leading, .trailing], 25)
                
                
                //MARK: - Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("Plants")
                            .font(.custom("Inter-Bold", size: 40))
                            .padding(.bottom, -1)
                        Text("Search the OpenFarm API for garden plants!")
                            .font(.custom("Inter-SemiBold", size: 21))
                    }.foregroundColor(.lightGreenHeader)
                        .padding(.top, -5)
                    Spacer()
                }.padding([.leading, .trailing], 25)
                
                //MARK: - Folders
                ScrollView(showsIndicators: false) {
                    ForEach(gl.folders, id: \.self) { folder in
                        ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 170)
                            .foregroundColor(.gray1)
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
                                                    .foregroundColor(Color.gray2)
                                        })
                                    }
                                }.padding(.leading, 15) //end hstack
                            }.padding(.top, 29) //end horizontal scrollview
                        }.padding(.bottom, 7) //end zstack
                    }.padding(.top, 15)
                        .padding([.leading, .trailing], 28)
                        .padding(.bottom, 60)
                }.padding(.top, 73) //end scrollview
                Spacer()
            } //end vstack
        
            
            //MARK: - Search Bar
            VStack {
                SearchBar()
                Spacer()
            }.padding(.top, 175)
            
            ZStack {
                NavBarPV()
            }
            
        } //end zstack
    }
}
