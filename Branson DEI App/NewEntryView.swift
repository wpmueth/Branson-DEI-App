//
//  NewEntryView.swift
//  Branson DEI App
//
//  Created by William Mueth on 6/11/23.
//

import SwiftUI
import CoreData

struct NewEntryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var title = ""
    @State private var content = ""
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            Color(hex: "#F8F5F0").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 40)
                    .overlay(
                        TextField("Title", text: $title)
                            .font(.headline)
                            .padding(.horizontal)
                    )
                
                Rectangle()
                    .fill(Color.white)
                    .overlay(
                        ZStack(alignment: .topLeading) {
                            if content.isEmpty && !isEditing {
                                Text("Record your thoughts here...")
                                    .foregroundColor(Color.gray.opacity(0.75))
                                    .font(.custom("Ubuntu-Regular", size: 18))
                                    .padding(.horizontal)
                                    .padding(.top, 6)
                            }
                            
                            TextEditor(text: $content)
                                .font(.custom("Ubuntu-Regular", size: 16))
                                .padding(.horizontal)
                                .opacity(content.isEmpty && !isEditing ? 0.25 : 1) // Adjust the opacity based on content presence
                                .accentColor(Color.blue) // Set the cursor color
                                .foregroundColor(Color.black.opacity(0.85))
                                .onTapGesture {
                                    isEditing = true
                                }
                        }
                    )
                    .frame(maxHeight: .infinity)
                
                Spacer()
            }
            .padding(.top, 30.0)
        }
        .navigationBarItems(trailing:
            Button(action: {
                saveEntry()
            }) {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
        )
    }
    
    private func saveEntry() {
        let newEntry = Entry(context: viewContext)
        newEntry.id = UUID()
        newEntry.date = Date()
        newEntry.title = title
        newEntry.content = content
        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print(error)
        }
    }
}
