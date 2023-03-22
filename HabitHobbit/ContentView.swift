//
//  ContentView.swift
//  HabitHobbit
//
//  Created by Prakhar Trivedi on 22/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var activities: [Activity] = []
    
    var body: some View {
        NavigationView {
            List {
                if activities.count != 0 {
                    ForEach(activities, id: \.id) { activity in
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
            .toolbar {
                Button {
                    print("Hello")
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
