//
//  ContentView.swift
//  HabitHobbit
//
//  Created by Prakhar Trivedi on 22/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var allActivities = Activities()
    
    @State var newActivitySheetIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                if allActivities.activities.count != 0 {
                    ForEach(allActivities.activities) { activity in
                        Text("\(activity.title)")
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
