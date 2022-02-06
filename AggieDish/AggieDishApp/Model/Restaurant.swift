//
//  Restaurant.swift
//  AggieDish
//
//  Created by Ruiyi He on 1/29/22.
//

import Foundation
import SwiftUI

struct Restaurant: Hashable, Codable, Identifiable {
    var id: Int
    var restaurantImage: String
    var restaurantName: String
    var openHours: String
    var location: String
    var expectPickupTime: String
    

//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
}

//struct Restaurant: Decodable {
//    let id: Int
//    let restaurantImage: String
//    let restaurantName: String
//    let openHours: String
//    let location: String
//    let expectPickupTime: String
//}
