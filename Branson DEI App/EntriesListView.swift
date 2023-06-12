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
                    .onTapGesture {
                        confirmDeleteEntry(entry: entry)
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
        }
        
        private func confirmDeleteEntry(entry: Entry) {
            let alert = UIAlertController(title: "Confirm Deletion",
                                          message: "Are you sure you want to delete this entry?",
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                deleteEntry(entry)
            }))
            
            if let topViewController = UIApplication.shared.windows.first?.rootViewController {
                topViewController.present(alert, animated: true, completion: nil)
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
