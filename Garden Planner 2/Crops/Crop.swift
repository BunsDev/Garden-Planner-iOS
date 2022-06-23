//
//  Crop.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import Foundation
import SwiftUI


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
    func hash(into hasher: inout Hasher) {
        hasher.combine(attributes)
    }
}
func getTestCrop() -> crop {
    return crop(attributes: atts(name: "Cherry Tomato Husky Red", main_image_path: "https://s3.amazonaws.com/openfarm-project/production/media/pictures/attachments/5e65715f23ddeb0004c9ddb8.jpg?1583706462", description: "Indeterminate,  compact"))
}


//MARK: - Atts
struct atts: Codable, Hashable {
    let name: String
    let main_image_path: String
    let description: String?
}
extension atts: Equatable {
    public static func ==(lhs: atts, rhs: atts) -> Bool {
        return lhs.name == rhs.name && lhs.main_image_path == rhs.main_image_path && lhs.description == rhs.description
    }
}

