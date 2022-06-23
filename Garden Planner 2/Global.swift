//
//  Global.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/22/22.
//

import Foundation
import SwiftUI

//MARK: - Global Variables
class Global: ObservableObject {
    @Published var view = "PlantsView"
    @Published var passCrop = crop(attributes: atts(name: "test", main_image_path: "", description: ""))
    @Published var passFolder = folder(name: "Test Folder", contents: [getTestCrop()], selected: false, tags: [])
    @Published var folders = [folder(name: "Favorites", contents: [], selected: false, tags: []), folder(name: "Garden Bed 2", contents: [], selected: false, tags: [])]
}


//MARK: - Colors
extension Color {
    static let green1 = Color("green1")
    static let green2 = Color("green2")
    static let greenTitle = Color("greenTitle")
    static let darkGreen = Color("darkGreen")
}
