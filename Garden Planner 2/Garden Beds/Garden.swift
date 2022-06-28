//
//  Garden.swift
//  Garden Planner 2
//
//  Created by Sophie Fortier on 6/27/22.
//

import SwiftUI
import Foundation

struct gardenBed: Hashable {
    var name: String
    var width: Int
    var height: Int
    var contents: [crop]
    var selected: Bool
}

