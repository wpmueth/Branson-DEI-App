//
//  EntriesListView.swift
//  Branson DEI App
//
//  Created by William Mueth on 6/11/23.
//

import SwiftUI
import CoreData

struct EntriesListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Entry.date, ascending: false)],
        animation: .default)
    private var entries: FetchedResults<Entry>
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#F8F5F0")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    List {
                        ForEach(entries) { entry in
                            EntryRowView(entry: entry, viewContext: viewContext)
                        }
                        .onDelete(perform: deleteEntries)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Entries")
            .navigationBarItems(trailing: EmptyView())
            
        }
    }
    
    private func deleteEntries(offsets: IndexSet) {
        withAnimation {
            offsets.map { entries[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    private struct EntryRowView: View {
        let entry: Entry
        let viewContext: NSManagedObjectContext
        @State private var isShowingEntry = false
        @State private var showingDeleteConfirmation = false // Add this line
        
        private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter
        }()
        
        var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(entry.title ?? "No Title")
                        .font(.headline)
                    if let date = entry.date {
                        Text(dateFormatter.string(from: date))
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .frame(width: 15.0, height: 15.0)
                    .onTapGesture {
                        showingDeleteConfirmation = true // show alert instead of calling the function
                    }
                    .padding(.trailing)
                    .contentShape(Rectangle())
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                isShowingEntry = true
            }
            .sheet(isPresented: $isShowingEntry) {
                EntryDetailView(entry: entry)
            }
            .alert(isPresented: $showingDeleteConfirmation) {
                Alert(title: Text("Confirm Deletion"), message: Text("Are you sure you want to delete this entry?"), primaryButton: .destructive(Text("Delete")) {
                    deleteEntry(entry)
                }, secondaryButton: .cancel())
            }
        }
        
        private func deleteEntry(_ entry: Entry) {
            withAnimation {
                viewContext.delete(entry)
                do {
                    try viewContext.save()
                } catch {
                    print(error)
                }
            }
        }
    }
}
