//
//  DEIOverviewView.swift
//  Diversity, Equity, and Inclusion App
//
//  Created by William Mueth on 6/10/23.
//

import SwiftUI

struct DEIOverviewView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#def0fe"))
                        .frame(height: 200)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Image("world_DEI")
                        .resizable()
                        .frame(width: 170, height: 170)
                }
                
                Text("Overview: Our Purpose")
                    .font(.custom("Ubuntu", size: 26))
                    .foregroundColor(Color.black)
                
                Text("Diversity, Equity, and Inclusion (DEI) are foundational to building environments that respect and embrace diverse backgrounds and perspectives. These principles embody a commitment to acknowledging a range of identities, ensuring fairness in opportunities, and cultivating a sense of belonging for everyone, critical in today's interconnected world. The importance of DEI extends beyond just representation. It fosters mutual understanding and respect among individuals of different races, religions, genders, and socioeconomic backgrounds.")
                    .font(.custom("Ubuntu", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                    .padding(.bottom)
                
                Text("However, DEI also serves as a reminder of the potential pitfalls of neglecting these principles, which can lead to the perpetuation of systemic inequalities and biases. In essence, DEI is about creating a society that appreciates the unique value each person brings, fostering societal growth, and developing spaces where every individual can thrive. By embracing DEI, we contribute to building a more fair, inclusive, and harmonious world.")
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

struct DEIOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        DEIOverviewView()
    }
}
