//
//  ViewController.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import SwiftUI
import Foundation

class Global: ObservableObject {
    @Published var view = "PlantsView"
    @Published var passCrop = crop(attributes: atts(name: "Cherry Tomato Husky Red", main_image_path: "https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/5e65715f23ddeb0004c9ddb8.jpg?1583706462", description: "Indeterminate,  compact"))
    @Published var folders = [
        folder(name: "Favorites", contents: [])]
}

struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ViewController()
            .environmentObject(Global())
    }
}

struct ViewController: View {
    
    @EnvironmentObject var gl: Global
    
    var body: some View {
        switch gl.view {
        case "PlantsView":
            PlantsView()
        case "CropDetailView":
            CropDetailView()
        default:
            Text("ERROR: Default")
        }
    }
}
