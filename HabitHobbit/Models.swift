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
}

class Activities: ObservableObject {
    @Published var activities: [Activity] = []
}
