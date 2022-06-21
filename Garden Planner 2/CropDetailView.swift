//
//  CropDetailView.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import SwiftUI

struct CropDetailView_Preview: PreviewProvider {
    static var previews: some View {
        CropDetailView()
            .environmentObject(Global())
    }
}

struct CropDetailView: View {
    
    @EnvironmentObject var gl: Global
    @StateObject var vm = CropDetailVM()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    if inFavs() && !vm.hearted {
                        userFolders().favorites.contents.removeAll(where: {$0 == gl.passCrop})
                    }
                    if !inFavs() && vm.hearted {
                        userFolders().favorites.contents.append(gl.passCrop)
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
            }
            
            VStack(alignment: .leading) {
                if gl.passCrop.attributes.main_image_path.prefix(4) != "http" {
                    AsyncImage(url: URL(string: getReplacementImage()), content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 210)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(5)
                    }, placeholder: {
                        Placeholder()
                    })
                } else {
                    AsyncImage(url: URL(string: gl.passCrop.attributes.main_image_path), content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 210)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(5)
                    }, placeholder: {
                        Placeholder()
                    })
                }
                Text(gl.passCrop.attributes.name.capitalized)
                    .font(.system(size: 30, weight: .bold))
                
                if gl.passCrop.attributes.description != nil {
                    Text("Description")
                        .font(.system(size: 20, weight: .semibold))
                        .padding([.top, .bottom], 1)
                    Text(gl.passCrop.attributes.description!)
                }
                
            }.padding(.top, 20)
            
            Spacer()
            
        }.padding([.leading, .trailing], 15)
            .onAppear {
                if inFavs() {
                    vm.hearted = true
                } else {
                    vm.hearted = false
                }
            }
    }
}

extension CropDetailView {
    @MainActor class CropDetailVM: ObservableObject {
        @Published var hearted = false
    }
    func inFavs() -> Bool {
        for crop in userFolders().favorites.contents {
            if crop == Global().passCrop {
                return true
            }
        }
        return false
    }
    
    func getReplacementImage() -> String {
//        Api().getImages(searchTerm: gl.passCrop.attributes.name)
//        return Api().imagesResponse!.images_results[0].thumbnail
        return ""
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
