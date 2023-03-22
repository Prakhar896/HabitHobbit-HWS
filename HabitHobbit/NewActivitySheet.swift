//
//  NewActivitySheet.swift
//  HabitHobbit
//
//  Created by Prakhar Trivedi on 22/3/23.
//

import SwiftUI

struct NewActivitySheet: View {
    @ObservedObject var allActivities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var description: String = ""
    @FocusState var titleIsFocused: Bool
    @FocusState var descIsFocused: Bool
    
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @State var alertIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                        .focused($titleIsFocused)
                    TextField("Description", text: $description, axis: .vertical)
                        .frame(height: 80)
                        .focused($descIsFocused)
                }
            }
            .navigationTitle(title == "" ? "New Activity": title)
            .alert(alertTitle, isPresented: $alertIsPresented) {
                Button("OK") {}
            } message: {
                Text("\(alertMessage)")
            }
            .toolbar {
                Button("Add") {
                    evaluateAndAddActivity()
                }
            }
            .onAppear {
                titleIsFocused = true
            }
            .onSubmit {
                evaluateAndAddActivity()
            }
        }
    }
    
    func evaluateAndAddActivity() {
        if title.count == 0 || description.count == 0 {
            alertTitle = "One or more values not provided."
            alertMessage = "An error occurred as either the title or description, or both, of the activity were not provided."
            alertIsPresented = true
        } else {
            allActivities.activities.append(Activity(title: title, description: description, completions: []))
            dismiss()
        }
    }
}

struct NewActivitySheet_Previews: PreviewProvider {
    static var previews: some View {
        NewActivitySheet(allActivities: Activities())
    }
}
