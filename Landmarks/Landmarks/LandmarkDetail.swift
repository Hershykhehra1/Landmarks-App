//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Harshaun Khehra on 6/12/24.
//

import SwiftUI
import MapKit

// Defining a structure named LandmarkDetail that conforms to the View protocol
struct LandmarkDetail: View {
    //@EnvironmentObject is used to share data across multiple views in an app and it shares data between different views and updates those views when data changes
    //modelData is an environment object, type ModelData, modelData is shared across views, changes to modelData will update any view that depends on it, useful for data that needs to be modified by multiple views(shared data model)
    @EnvironmentObject var modelData: ModelData
    // Defining a variable to hold a specific landmark
    //using the landmark variable we can call different parts of the landmark to retrieve the name, image, etc.
    var landmark: Landmark
    
    // A computed property to get the index of the current landmark in the modelData's landmarks array
    //the value is calculated every time it is accessed
    //modelData accesses the modelData property which is an environment object containing shared data, accessing the landmarks array in modelData
    //firstIndex(where:) method is called on landmarks array, this returns the index of the first element that satisfies the given predicate
    //the predicate is inside the closure, { $0.id == landmarks.id} and it compares the id of each landmark in the landmarks array to the id of the landmark instance associated in the view, $0 represents eachlandmark in the array during the search
    //the "!" at the end force unwraps the optional value, meaning it assumes firstIndex(where:) will always find a matching element and return a valid index, if no matching element is found it will crash the program
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    
    // The body property, which defines the view's layout and behavior
    var body: some View {
        // Using ScrollView to enable scrolling of the content
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    // Applying the title2 font
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[3])
        .environmentObject(ModelData())
}
