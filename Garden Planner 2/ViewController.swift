//
//  ViewController.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import SwiftUI

class Global: ObservableObject {
    @Published var view = "PlantsView"
    @Published var passCrop = crop(attributes: atts(name: "Poblano Pepper", main_image_path: ""))
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
