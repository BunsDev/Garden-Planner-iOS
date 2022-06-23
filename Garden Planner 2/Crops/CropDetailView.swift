//
//  CropDetailView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import SwiftUI

struct CropDetail_Preview: PreviewProvider {
    static var previews: some View {
        CropDetailView()
            .environmentObject(Global())
    }
}

struct CropDetailView: View {
    
    @EnvironmentObject var gl: Global
    @ObservedObject var vm = CropDetailVM()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        if vm.hearted && !inFavs() {
                            gl.folders[0].contents.append(gl.passCrop)
                        } else if !vm.hearted && inFavs() {
                            gl.folders[0].contents.removeAll(where: {$0 == gl.passCrop})
                        }
                        gl.view = "PlantsView"
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                    Spacer()
                    Button(action: {
                        vm.hearted.toggle()
                    }) {
                        Image(systemName: vm.hearted ? "heart.fill" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 22)
                            .foregroundColor(.pink)
                            .padding(.trailing, 10)
                    }
                }.padding([.leading, .trailing], 15)
                ScrollView {
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: gl.passCrop.attributes.main_image_path), content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 210)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(5)
                        }, placeholder: {
                            Placeholder()
                        })
                        Text(gl.passCrop.attributes.name.capitalized)
                            .font(.system(size: 30, weight: .bold))
                        
                        if gl.passCrop.attributes.description != nil {
                            Text("Description")
                                .font(.system(size: 20, weight: .semibold))
                                .padding([.top, .bottom], 1)
                            Text(gl.passCrop.attributes.description!)
                        }
                        
                    }.padding(.top, 20)
                        .padding([.leading, .trailing], 15)
                }
                Spacer()
                
            }
        }.onAppear(perform: { vm.hearted = inFavs()} )
    }
}

extension CropDetailView {
    @MainActor class CropDetailVM: ObservableObject {
        @Published var hearted = false
    }
    func inFavs() -> Bool {
        if gl.folders[0].contents.contains(where: {$0 == gl.passCrop}) {
            return true
        } else {
            return false
        }
    }
}

struct Placeholder: View {
    var body: some View {
        Rectangle()
            .frame(height: 210)
            .frame(maxWidth: .infinity)
            .cornerRadius(5)
            .foregroundColor(Color("gray1"))
            .overlay(
                Text("No Image Available")
                    .foregroundColor(Color("gray2"))
            )
    }
}
