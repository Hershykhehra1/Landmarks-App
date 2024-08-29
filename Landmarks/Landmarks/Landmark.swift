//
//  Landmark.swift
//  Landmarks
//
//  Created by Harshaun Khehra on 6/5/24.
//

import Foundation
import SwiftUI
import CoreLocation

//hashable = searchable by id, searching
//Codable = read file by the code/id

//Hashable: Allows objects to be stored in sets and used as dictionary keys by providing unique hash value
//Codeable: Allows for easy encoding and decoding of objects to and from formats like JSON
//Identifiable: Provides a unique identifier for objects, making it easier to manage and update
struct Landmark: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    struct Coordinates: Hashable, Codable {
            var latitude: Double
            var longitude: Double
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
}
