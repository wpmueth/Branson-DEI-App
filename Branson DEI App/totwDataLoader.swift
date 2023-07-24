//
//  totwDataLoader.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/9/23.
//

import SwiftUI

struct DEITerm: Decodable {
    let term: String
    let definition: String
    let impact: String
    let example: String
    let myths: String
    let reflection: String
}

func loadTerms() -> [DEITerm] {
    if let url = Bundle.main.url(forResource: "totwdata", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedTerms = try decoder.decode([DEITerm].self, from: data)
            print("Successfully loaded and decoded \(decodedTerms.count) terms.")
            return decodedTerms
        } catch {
            print("Error loading or parsing totwdata.json: \(error)")
        }
    } else {
        print("Could not find totwdata.json file in the bundle.")
    }
    return []
}
