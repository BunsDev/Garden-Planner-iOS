//
//  CreateFolderView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/22/22.
//

import SwiftUI

struct DeleteFolder_Preview: PreviewProvider {
    static var previews: some View {
        DeleteFolder()
            .environmentObject(Global())
    }
}

struct DeleteFolder: View {
    
    @EnvironmentObject var gl: Global
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: - Header
            VStack(alignment: .leading) {
                Text("Delete a Folder")
                    .font(.custom("Inter-Bold", size: 40))
                    .padding(.bottom, -1)
                Text("Select a folder from the list below.")
                    .font(.custom("Inter-SemiBold", size: 21))
            } .padding(.top, -5)
            
            
            //MARK: - Select/Deselect
            HStack {
                Spacer()
                if allDeselected() {
                    Button(action: {
                        selectAll()
                    }) {
                        Text("Select All")
                            .font(.custom("Inter-Medium", size: 17))
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 7)
                            .background(Color.lightGreen)
                            .foregroundColor(.darkGreen)
                            .cornerRadius(20)
                    }
                } else {
                    Button(action: {
                        deselectAll()
                    }) {
                        Text("Deselect All")
                            .font(.custom("Inter-Medium", size: 17))
                            .padding([.leading, .trailing], 15)
                            .padding([.top, .bottom], 7)
                            .background(Color.lightGreen)
                            .foregroundColor(.darkGreen)
                            .cornerRadius(20)
                    }
                }
            }.padding(.top, 10)
                .padding(.trailing, 6)
            
            
            //MARK: - Folders
            VStack(alignment: .leading) {
                ForEach(gl.folders, id: \.self) { folder in
                    Button(action: {
                        let i = gl.folders.firstIndex(where: {$0.name == folder.name})
                        if !gl.folders[i!].selected {
                            gl.folders[i!].selected = true
                        } else {
                            gl.folders[i!].selected = false
                        }
                    }) {
                        HStack {
                            ZStack {
                                Image(systemName: folder.selected ? "circle.fill" : "circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.lightGreen)
                                Image(systemName: folder.selected ? "checkmark.circle" : "circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.darkGreen)
                            }.frame(height: 25)
                                .padding(.trailing, 8)
                            Text(folder.name)
                                .font(.custom("Inter-Medium", size: 25))
                        }
                    }
                }
            }.padding(.top, 15)
                .padding(.leading, 5)
            
            
            //MARK: - Buttons
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        removeSelected()
                        gl.view = "Plants"
                    }) {
                        RoundedRectangle(cornerRadius: 22)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("Delete")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter-SemiBold", size: 20))
                            )
                    }
                    Spacer()
                }.padding(.bottom, 20)
                Button(action: {
                    gl.view = "Plants"
                }) {
                    Text("Cancel")
                        .font(.custom("Inter-SemiBold", size: 17))
                }.padding(.bottom, 15)
            }
            
            
        }.padding([.leading, .trailing], 25)
            .padding(.top, 50)
            .foregroundColor(.darkGreen)
    }
}

extension DeleteFolder {
    func selectAll() {
        for folder in gl.folders {
            let i = gl.folders.firstIndex(where: {$0 == folder})
            gl.folders[i!].selected = true
        }
    }
    func allDeselected() -> Bool {
        for folder in gl.folders {
            if folder.selected{
                return false
            }
        }
        return true
    }
    func deselectAll() {
        for folder in gl.folders {
            let i = gl.folders.firstIndex(where: {$0 == folder})
            gl.folders[i!].selected = false
        }
    }
    func removeSelected() {
        for folder in gl.folders {
            if folder.selected {
                gl.folders.removeAll(where: {$0 == folder})
            }
        }
    }
}

