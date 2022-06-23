//
//  ViewController.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import SwiftUI
import Foundation

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
        case "CreateFolderView":
            CreateFolderView()
        default:
            Text("ERROR: Default")
        }
    }
}


