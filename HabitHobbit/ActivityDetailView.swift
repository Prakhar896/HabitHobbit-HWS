//
//  ActivityDetailView.swift
//  HabitHobbit
//
//  Created by Prakhar Trivedi on 22/3/23.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var allActivities: Activities
    @Environment(\.dismiss) var dismiss
    var activityID: String
    
    var targetActivity: Activity? {
        let targets = allActivities.activities.filter({ $0.id == activityID })
        
        if targets.count == 1 {
            return targets[0]
        } else {
            return nil
        }
    }
    var targetActivityIndex: Int? {
        return allActivities.activities.firstIndex(where: { $0.id == activityID })
    }
    
    var body: some View {
        if let targetActivity = targetActivity, let targetActivityIndex = targetActivityIndex {
            List {
                Section {
                    Text("\(targetActivity.description)")
                } header: {
                    Text("Description")
                }
                
                if targetActivity.completions.count != 0 {
                    Section {
                        ForEach(targetActivity.completions, id: \.self) { completionDate in
                            Text(completionDate.formatted(date: .long, time: .standard))
                                .font(.system(size: 18, weight: .bold))
                        }
                    } header: {
                        Text("Completions")
                    }
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
        } else {
            Button("Failed to load that activity. Click here to return back.") {
                dismiss()
            }
            .navigationTitle("Error occurred.")
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static let exampleActivities = Activities()
    
    static var previews: some View {
        ActivityDetailView(allActivities: exampleActivities, activityID: exampleActivities.activities[0].id)
    }
}
