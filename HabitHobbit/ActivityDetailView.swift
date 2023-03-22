//
//  ActivityDetailView.swift
//  HabitHobbit
//
//  Created by Prakhar Trivedi on 22/3/23.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var allActivities: Activities
    var activityID: String
    
    var targetActivity: Activity {
        return allActivities.activities.filter({ $0.id == activityID })[0]
    }
    var targetActivityIndex: Int {
        return allActivities.activities.firstIndex(where: { $0.id == activityID }) ?? 0
    }
    
    var body: some View {
        List {
            Section {
                Text("\(targetActivity.description)")
            } header: {
                Text("Description")
            }
            
            Section {
                ForEach(targetActivity.completions, id: \.self) { completionDate in
                    Text(completionDate.formatted(date: .long, time: .standard))
                        .font(.system(size: 18, weight: .bold))
                }
            } header: {
                Text("Completions")
            }
        }
        .navigationTitle(targetActivity.title)
        .toolbar {
            Button {
                withAnimation {
                    allActivities.activities[targetActivityIndex].completions.insert(Date.now, at: 0)
                }
            } label: {
                Image(systemName: "checkmark")
            }
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static let exampleActivities = Activities()
    
    static var previews: some View {
        ActivityDetailView(allActivities: exampleActivities, activityID: exampleActivities.activities[0].id)
    }
}
