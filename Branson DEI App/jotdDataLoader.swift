//
//  jotdDataLoader.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/10/23.
//

import Foundation

// Define your struct to match the structure of objects in your JSON file
struct JOTD: Codable {
    let id: Int
    let text: String
}

// Create a function to load and decode the JSON data into an array of JOTD
func loadJOTDs() -> [JOTD] {
    if let url = Bundle.main.url(forResource: "jotddata", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedJOTDs = try decoder.decode([JOTD].self, from: data)
            print("Successfully loaded and decoded \(decodedJOTDs.count) prompts.")
            return decodedJOTDs
        } catch {
            print("Error loading or parsing jotddata.json: \(error)")
        }
    } else {
        print("Could not find jotddata.json file in the bundle.")
    }
    return []
}
