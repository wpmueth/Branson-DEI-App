//
//  EntryDetailView.swift
//  Branson DEI App
//
//  Created by William Mueth on 6/11/23.
//

import SwiftUI

struct EntryDetailView: View {
    let entry: Entry

    var body: some View {
        VStack {
            Text(entry.title ?? "No Title")
                .font(.headline)
            Text(entry.content ?? "No Content")
                .font(.body)
        }
        .padding()
        .navigationTitle("Entry Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
