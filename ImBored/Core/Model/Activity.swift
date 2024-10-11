//
//  Activity.swift
//  ImBored
//
//  Created by Joseph Iglecias on 10/10/24.
//

import Foundation

struct Activity: Codable, Identifiable {
    let id = UUID()
    let activity: String
    let type: String
    let kidFriendly: Bool
    
}

struct Activities: Codable {
    let activities: [Activity]
}

