//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Harshaun Khehra on 6/12/24.
//

import SwiftUI

struct LandmarkList: View {
    
    //@EnvironmentObject is used to share data across multiple views in an app and it shares data between different views and updates those views when data changes
    //modelData is an environment object, type ModelData, modelData is shared across views, changes to modelData will update any view that depends on it, useful for data that needs to be modified by multiple views(shared data model)
    @EnvironmentObject var modelData: ModelData
    

    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

#Preview {
    LandmarkList()
        // Provide the shared data for the preview
        .environmentObject(ModelData())
}
