//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Harshaun Khehra on 5/29/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        
        WindowGroup {
            
            // Set the initial view of the app to ContentView.
            ContentView()
                
                // Pass the shared data through the views
                .environmentObject(modelData)
        }
    }
}
