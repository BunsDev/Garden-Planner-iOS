//
//  CreateFolderView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/22/22.
//

import SwiftUI
import WrappingHStack

struct CreateFolder_Preview: PreviewProvider {
    static var previews: some View {
        CreateFolderView()
            .environmentObject(Global())
    }
}

struct CreateFolderView: View {
    
    @EnvironmentObject var gl: Global
    @ObservedObject var vm = CreateFolderVM()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //MARK: - Header
            VStack(alignment: .leading) {
                Text("Create a Folder")
                    .font(.custom("Inter-Bold", size: 40))
                    .padding(.bottom, -1)
                Text("Pick a name and a few tags to get started.")
                    .font(.custom("Inter-SemiBold", size: 21))
            }
            .foregroundColor(.darkGreen)
                .padding(.top, -5)
            
            
            //MARK: - Name
            Group {
                if !vm.noNameError {
                Text("NAME")
                    .font(.custom("Inter-SemiBold", size: 16))
                    .foregroundColor(.accentColor)
                    .padding(.top, 20)
                } else {
                    Text("NAME: CAN'T BE BLANK")
                        .font(.custom("Inter-SemiBold", size: 16))
                        .foregroundColor(Color("redish"))
                        .padding(.top, 20)
                }
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color("gray1"))
                    .frame(height: 50)
                    .overlay(
                        TextField("Ex: Corner Garden Bed", text: $vm.name)
                            .padding([.leading, .trailing], 15)
                    )
            }
            
            
            //MARK: - Tags
            Group{
                Text("OPTIONAL TAGS")
                .font(.custom("Inter-SemiBold", size: 16))
                .foregroundColor(.accentColor)
                .padding(.top, 20)
            
                WrappingHStack(FolderTags().tags, id: \.self) { tag in
                    if notInTags(item: tag) {
                        Button(action: {
                            vm.selectedTags.append(tag)
                        }) {
                            Group {
                                Text(tag)
                                    .font(.custom("Inter-Medium", size: 16))
                                    .padding([.leading, .trailing], 15)
                                    .padding([.top, .bottom], 7)
                                    .background(Color.lightestGreen)
                                    .foregroundColor(.darkGreen)
                                    .cornerRadius(20)
                            }.padding(.bottom, 12)
                        }
                    } else {
                        Button(action: {
                            vm.selectedTags.removeAll(where: {$0 == tag})
                        }) {
                            Group {
                                Text(tag)
                                    .font(.custom("Inter-Medium", size: 16))
                                    .padding([.leading, .trailing], 15)
                                    .padding([.top, .bottom], 7)
                                    .background(Color.darkGreen)
                                    .foregroundColor(.lightestGreen)
                                    .cornerRadius(20)
                            }.padding(.bottom, 12)
                        }
                    }
                }
                    .frame(width: 300)
            }
            Spacer()
            
            
            //MARK: - Buttons
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        if vm.name.isEmpty {
                            vm.noNameError = true
                        } else {
                            gl.folders.append(folder(name: vm.name, contents: [], selected: false, tags: vm.selectedTags))
                            gl.view = "PlantsView"
                        }
                    }) {
                        RoundedRectangle(cornerRadius: 22)
                            .foregroundColor(.darkGreen)
                            .frame(width: 130, height: 50)
                            .overlay(
                                Text("Create")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter-SemiBold", size: 20))
                            )
                    }
                    Spacer()
                }.padding(.bottom, 20)
                Button(action: {
                    gl.view = "PlantsView"
                }) {
                    Text("Cancel")
                        .font(.custom("Inter-SemiBold", size: 17))
                        .foregroundColor(.darkGreen)
                }.padding(.bottom, 15)
            }
            
            
        }.padding([.leading, .trailing], 25)
            .padding(.top, 50)
    }
}

extension CreateFolderView {
    @MainActor class CreateFolderVM: ObservableObject {
        @Published var name = ""
        @Published var noNameError = false
        @Published var selectedTags = [String]()
    }
    func notInTags(item: String) -> Bool {
        if vm.selectedTags.contains(where: {$0 == item}) {
            return false
        }
        return true
    }
}



