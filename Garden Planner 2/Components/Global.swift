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
    @Published var view = "Planner"
    @Published var passCrop = crop(attributes: atts(name: "test", main_image_path: "", description: ""))
    @Published var passFolder = folder(name: "Test Folder", contents: [getTestCrop()], selected: false)
    @Published var folders = [folder(name: "Favorites", contents: [], selected: false), folder(name: "Garden Bed 2", contents: [], selected: false)]
    @Published var passBed = gardenBed(name: "Garden Bed 1", width: 4, height: 6, contents: [getTestCrop()], selected: false)
    @Published var beds = [gardenBed(name: "Garden Bed 1", width: 4, height: 6, contents: [], selected: false)]
}


//MARK: - Colors
extension Color {
    static let lightestGreen = Color("lightestGreen")
    static let lightGreen = Color("lightGreen")
    static let lightGreenHeader = Color("lightGreenHeader")
    static let navGreen = Color("navGreen")
    static let darkGreen = Color("darkGreen")
    static let gray1 = Color("gray1")
    static let gray2 = Color("gray2")
    static let redish = Color("redish")
}
