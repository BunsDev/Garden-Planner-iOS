//
//  Models.swift
//  Garden Planner 2
//
//  Created by Sophia Fortier on 6/20/22.
//

import Foundation

class userFolders: ObservableObject {
    var favorites = folder(name: "Favorites", contents: [])
}
extension userFolders {
    public static func ==(lhs: userFolders, rhs: userFolders) -> Bool {
        return lhs.favorites == rhs.favorites
    }
}

struct folder: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var contents: [crop]
}
extension folder {
    public static func ==(lhs: folder, rhs: folder) -> Bool {
        return lhs.name == rhs.name && lhs.contents == rhs.contents
    }
}

