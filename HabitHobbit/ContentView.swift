//
//  ContentView.swift
//  HabitHobbit
//
//  Created by Prakhar Trivedi on 22/3/23.
//

import SwiftUI

struct ActivityCell: View {
    let activity: Activity
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(activity.title)")
                    .font(.system(size: 22, weight: .bold))
                Text("Created \(activity.dayDiff)")
                    .font(.callout)
                    .opacity(0.6)
            }
            
            Spacer()
            
            VStack(spacing: 10) {
                Text("\(activity.completions.count)")
                    .font(.title3.weight(.heavy))
                Text("Completion" + (activity.completions.count > 1 ? "s": ""))
                    .font(.callout)
            }
        }
        .padding()
    }
}

struct ContentView: View {
    @StateObject var allActivities = Activities()
    
    @State var newActivitySheetIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                if allActivities.activities.count != 0 {
                    ForEach(allActivities.activities) { activity in
                        ActivityCell(activity: activity)
                    }
                } else {
                    Text("No activities created yet!\nHit the '+' button to get started!")
                        .font(.headline.weight(.bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("HabitHobbit")
            .sheet(isPresented: $newActivitySheetIsPresented) {
                NewActivitySheet(allActivities: allActivities)
            }
            .toolbar {
                Button {
                    newActivitySheetIsPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
