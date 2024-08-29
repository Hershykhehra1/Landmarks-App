//
//  ModelData.swift
//  Landmarks
//
//  Created by Harshaun Khehra on 6/5/24.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]]{
        Dictionary(grouping: landmarks, by: {$0.category.rawValue})
    }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Can't Open File")
    }
    
    do {
        
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Can't Read File")
    }
    
    do {
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Data wrong")
    }
}
