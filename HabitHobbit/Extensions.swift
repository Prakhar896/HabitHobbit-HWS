//
//  Extensions.swift
//  HabitHobbit
//
//  Created by Prakhar Trivedi on 22/3/23.
//

import Foundation

func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
    let numberOfDays = Calendar.current.dateComponents([.day], from: from, to: to)
        
    return numberOfDays.day!
}

extension UserDefaults {
    static func clearAll() {
        let defaults = standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
