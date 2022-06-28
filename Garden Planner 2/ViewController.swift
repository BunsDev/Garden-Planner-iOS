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
        case "Plants":
            Plants()
        case "CreateFolder":
            CreateFolder()
        case "DeleteFolder":
            DeleteFolder()
        case "TasksAndNotifs":
            TasksAndNotifs()
        case "Planner":
            Planner()
        case "CreateGarden":
            CreateGarden()
        case "DeleteGarden":
            DeleteGarden()
        case "GardenDetail":
            GardenDetail()
        case "CropDetail":
            CropDetail()
        default:
            Text("ERROR: Default")
        }
    }
}


