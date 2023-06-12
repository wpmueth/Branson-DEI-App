//
//  ContentView.swift
//  Diversity, Equity, and Inclusion App
//
//  Created by William Mueth on 6/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        TabView {
            
            DashboardView()
                .padding(.bottom)
                .tabItem()
                {
                    Image(systemName: "house.fill")
                    Text("Dashboard")
                }
            JournalingMainView()
                .padding(.bottom)
                .tabItem() {
                    Image(systemName: "book.fill")
                    Text("Journaling")
                }
            ResourcesMainView()
                .padding(.bottom)
                .tabItem() {
                    Image(systemName: "folder.fill")
                    Text("Resources")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
