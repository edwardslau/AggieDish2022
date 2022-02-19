//
//  Menu.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/6/22.
//

import Foundation
import SwiftUI

struct Menu: Hashable, Codable, Identifiable {
    var id: Int
    var foodName: String
    var allergens: [String]
    var calories: Int
    var customizationOptions: [String]
}

var menus: [Menu] = load("menus.json")
