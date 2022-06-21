//
//  ImageApiTest.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/21/22.
//

import SwiftUI

struct IAT_Previews: PreviewProvider {
    static var previews: some View {
        ImageApiTest()
    }
}



struct ImageApiTest: View {
    
    @State var showImages = false
    @State var link: String = ""
    
    var body: some View {
        NavigationView {
            SearchBar2()
                .navigationTitle("Image Search Test")
        }
    }
}


struct myImageData: Codable {
    let search_metadata: [resStatus]
}

struct resStatus: Codable {
    let status: String
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

class imageApi: ObservableObject {
    
    @Published var imagesResponse: myImageData? = nil
    
    //MARK: - getImages
    func getImages(searchTerm: String) {
        let urlString = "https://serpapi.com/playground?q=\(searchTerm.replacingOccurrences(of: " ", with: "+"))&tbm=isch&ijn=0"
        guard let url = URL(string: urlString) else {
            print("Invalid URL...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let results = try JSONDecoder().decode(myImageData.self, from: data)
                        self.imagesResponse = results
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .resume()
    }
}

struct SearchBar2: View {
    @State var searchStr = ""
    @State var showList = false
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
                        TextField("Search for plants...", text: $searchStr)
                            .onSubmit {
                                showList = true
                                imageApi().getImages(searchTerm: searchStr)
                            }
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                    }.padding(.leading, 10)
                        .foregroundColor(Color("gray2"))
                ).padding([.leading, .trailing], 15)
            
            //MARK: - List
            if showList {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("gray1"))
                    if imageApi().imagesResponse?.search_metadata != nil {
                        Text("Empty")
                    } else {
                        Text("nil")
                    }
//                    ScrollView(showsIndicators: false) {
//                        VStack {
//                            ForEach(imageApi().imagesResponse?.images_results ?? [], id: \.self) { image in
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 7)
//                                        .foregroundColor(.white)
//                                        .frame(height: 40)
//                                    Text(image.thumbnail)
//                                    }.padding([.leading, .trailing], 7)
//                            }
//                        }
//                    }.padding(.all, 5)
                }.frame(height: 400)
                    .padding([.leading, .trailing], 15)
            }
            Spacer()
        }
    }
}
