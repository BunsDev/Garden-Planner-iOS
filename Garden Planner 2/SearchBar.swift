//
//  SearchBar.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import SwiftUI

struct SearchBar_Preview: PreviewProvider {
    static var previews: some View {
        withBackGround()
            .environmentObject(Global())
    }
}

struct withBackGround: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green2).ignoresSafeArea()
            SearchBar()
        }
    }
}

struct SearchBar: View {
    
    @StateObject var api = Api()
    @EnvironmentObject var gl: Global
    @ObservedObject var vm = SearchBarVM()
    
    var body: some View {
        VStack {
            //MARK: - Search Bar
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .frame(height: 45)
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
                            }.font(.custom("Inter-Medium", size: 16))
                        if vm.showList {
                            Button(action: {
                                vm.showList = false
                                vm.searchStr = ""
                            }) {
                                Image(systemName: "x.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 20)
                            }
                        }
                    }.padding([.leading, .trailing], 15)
                        .foregroundColor(.accentColor)
                )
            
            //MARK: - List
            if vm.showList {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                    ScrollView(showsIndicators: false) {
                        VStack {
                            ForEach(api.response?.data ?? [], id: \.self) { crop in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color("gray1"))
                                        .frame(height: 40)
                                    Button(action: {
                                        gl.passCrop = crop
                                        gl.view = "CropDetailView"
                                    }) {
                                        HStack {
                                            Text(crop.attributes.name.capitalized)
                                                .font(.custom("Inter-Medium", size: 16))
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                        }
                                    }.padding([.leading, .trailing], 7)
                                }.padding([.top, .bottom], -2)
                            }
                        }
                    }.padding(.all, 7)
                }.frame(height: 400)
                
            }
        }.padding([.leading, .trailing], 25)
    }
}

extension SearchBar {
    @MainActor class SearchBarVM: ObservableObject {
        @Published var searchStr = ""
        @Published var showList = false
    }
}

//MARK: - API
public class Api: ObservableObject {
    
    @Published var response: myData? = nil
    
    //MARK: - getCrops
    func getCrops(searchTerm: String) {
        let urlString = "https://openfarm.cc/api/v1/crops/?filter=\(searchTerm.replacingOccurrences(of: " ", with: "_"))"
        guard let url = URL(string: urlString) else {
            print("Invalid URL...")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let results = try JSONDecoder().decode(myData.self, from: data)
                        self.response = results
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .resume()
    }
}


