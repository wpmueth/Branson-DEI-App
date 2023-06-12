//
//  Branson_DEI_AppApp.swift
//  Branson DEI App
//
//  Created by William Mueth on 6/11/23.
//

import SwiftUI

@main
struct Branson_DEI_AppApp: App {
    // This is your Core Data stack
    let persistenceController = PersistenceController.shared

    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor.white
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(hex: "142C8E")
        ]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(hex: "142C8E")
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
