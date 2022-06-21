//
//  Crop.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import Foundation
import SwiftUI

struct CropDetailView_Preview: PreviewProvider {
    static var previews: some View {
        CropDetailView()
            .environmentObject(Global())
    }
}

struct CropDetailView: View {
    @EnvironmentObject var gl: Global
    var body: some View {
        Button(action: {
            gl.view = "PlantsView"
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        }
    }
}


//MARK: - MyData
struct myData: Codable, Hashable {
    let data: [crop]
}
extension myData: Equatable {
    public static func ==(lhs: myData, rhs: myData) -> Bool {
        return lhs.data == rhs.data
    }
}

//MARK: - Crop
struct crop: Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    let attributes: atts
}
extension crop: Equatable {
    public static func ==(lhs: crop, rhs: crop) -> Bool {
        return lhs.attributes == rhs.attributes
    }
}

//MARK: - Atts
struct atts: Codable, Hashable {
    let name: String
    let main_image_path: String
}
extension atts: Equatable {
    public static func ==(lhs: atts, rhs: atts) -> Bool {
        return lhs.name == rhs.name && lhs.main_image_path == rhs.main_image_path
    }
}

//MARK: - API
public class Api: ObservableObject {
    
    @Published var response: myData? = nil
    
    func getCrops(searchString: String) {
        let urlString = "https://openfarm.cc/api/v1/crops/?filter=\(searchString.replacingOccurrences(of: " ", with: "_"))"
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

