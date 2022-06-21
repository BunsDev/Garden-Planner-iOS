//
//  SearchBar.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import SwiftUI

struct SearchBar_Preview: PreviewProvider {
    static var previews: some View {
        SearchBar()
            .environmentObject(Global())
    }
}

struct SearchBar: View {
    
    @StateObject var api = Api()
    @EnvironmentObject var gl: Global
    @ObservedObject var vm = SearchBarVM()
    
    var body: some View {
        VStack {
            //MARK: - Search Bar
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("gray1"))
                .frame(height: 38)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 17)
                        TextField("Search for plants...", text: $vm.searchStr)
                            .onSubmit {
                                vm.showList = true
                                api.getCrops(searchTerm: vm.searchStr)
                            }
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                    }.padding(.leading, 10)
                        .foregroundColor(Color("gray2"))
                )
            
            //MARK: - List
            if vm.showList {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("gray1"))
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(api.response?.data ?? [], id: \.self) { crop in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 7)
                                        .foregroundColor(.white)
                                        .frame(height: 40)
                                    Button(action: {
                                        gl.passCrop = crop
                                        gl.view = "CropDetailView"
                                    }) {
                                        HStack {
                                            Text(crop.attributes.name.capitalized)
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }
                                    }.padding([.leading, .trailing], 7)
                                }.padding([.top, .bottom], -2)
                            }
                        }
                    }.padding(.all, 5)
                }.frame(height: 400)
                
            }
        }.padding([.leading, .trailing], 15)
    }
}

extension SearchBar {
    @MainActor class SearchBarVM: ObservableObject {
        @Published var searchStr = ""
        @Published var showList = false
    }
}



