//
//  Models.swift
//  HabitHobbit
//
//  Created by Prakhar Trivedi on 22/3/23.
//

import Foundation

struct Activity: Codable, Identifiable {
    var id = UUID().uuidString
    var title: String
    var description: String
    var completions: [Date]
    var created = Date.now
    
    var dayDiff: String {
        let daysInBetween = numberOfDaysBetween(created, and: Date.now)
        if daysInBetween <= 1 {
            return "today"
        } else if daysInBetween <= 2 {
            return "yesterday"
        } else {
            return "\(daysInBetween) days ago"
        }
    }
}

class Activities: ObservableObject {
    @Published var activities: [Activity] = []
    
    init() {
        activities.append(Activity(title: "Sample", description: "This is an example activity.", completions: [Date.now]))
    }
}
