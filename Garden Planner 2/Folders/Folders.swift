//
//  Folders.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import Foundation
import SwiftUI

class FolderTags: ObservableObject {
    var tags = ["Outdoors", "Living Room", "Bedroom", "Dark", "Low Light", "Partial Sun", "Sunny"]
}



struct folder: Hashable {
    var name: String
    var contents: [crop]
    var selected: Bool
    var tags: [String]
}
extension folder {
    public static func ==(lhs: folder, rhs: folder) -> Bool {
        return lhs.name == rhs.name && lhs.contents == rhs.contents && lhs.selected == rhs.selected && lhs.tags == rhs.tags
    }
}


