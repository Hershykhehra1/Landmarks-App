//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Harshaun Khehra on 7/10/24.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notification: \(profile.prefersNotifications ? "On" : "Off")")
            
            Text("Season Photo: \(profile.seasonalPhoto.rawValue)")
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default) 
}
