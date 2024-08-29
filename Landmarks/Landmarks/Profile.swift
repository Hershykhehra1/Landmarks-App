//
//  Profile.swift
//  Landmarks
//
//  Created by Harshaun Khehra on 7/10/24.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.spring
    
    static let `default` = Profile(username: "Mike")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "💐" // Represents spring with a flower emoji
        case summer = "☀️" // Represents summer with a sun emoji
        case autumn = "🍁" // Represents autumn with a leaf emoji
        case winter = "❄️" // Represents winter with a snowflake emoji
        
        var id: String { rawValue } // Returns the raw value of the season, which is a string (emoji)
    }
}
