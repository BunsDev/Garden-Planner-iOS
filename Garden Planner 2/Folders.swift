//
//  Folders.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import Foundation
import SwiftUI

struct folder: Hashable {
    var name: String
    var contents: [crop]
}
extension folder {
    public static func ==(lhs: folder, rhs: folder) -> Bool {
        return lhs.name == rhs.name && lhs.contents == rhs.contents
    }
}

