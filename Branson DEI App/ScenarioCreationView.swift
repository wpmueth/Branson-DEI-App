//
//  ScenarioCreationView.swift
//  Diversity, Equity, and Inclusion App
//
//  Created by William Mueth on 6/10/23.
//

import SwiftUI

struct ScenarioCreationView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#fff2cc"))
                        .frame(height: 200)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Image("diversity_DEI")
                        .resizable()
                        .frame(width: 170, height: 170)
                }
                
                Text("Creating Our Case Scenarios")
                    .font(.custom("Ubuntu", size: 26))
                    .foregroundColor(Color.black)
                
                Text("In crafting these scenarios, we recognized the broad spectrum of communities globally, spanning various racial, ethnic, and LGBTQ+ identities. Understanding that each group encounters unique experiences, we aimed to depict realistic situations, reflective of their lives.")
                    .font(.custom("Ubuntu", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                    .padding(.bottom)
                
                Text("Stereotypes, while damaging and oversimplified, formed the core of these situations. From academic assumptions about Asians to misconceptions about bisexuality, we used common stereotypes to highlight potential microaggressions. This exercise allows us to promote inclusivity by acknowledging and challenging these preconceptions.")
                    .font(.custom("Ubuntu", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                    .padding(.bottom)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct ScenarioCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioCreationView()
    }
}
