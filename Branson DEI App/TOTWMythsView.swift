//
//  TOTWMythsView.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/2/23.
//

import SwiftUI

struct TOTWMythsView: View {
    let terms = loadTerms()
    let currentWeekOfYear = Calendar.current.component(.weekOfYear, from: Date())
    let term: DEITerm

    init() {
        if terms.isEmpty {
            print("No terms found.")
        } else if !terms.indices.contains(currentWeekOfYear - 1) {
            print("Week number \(currentWeekOfYear) is out of range. Only \(terms.count) terms found.")
        }
        term = terms.indices.contains(currentWeekOfYear - 1) ? terms[currentWeekOfYear - 1] : DEITerm(term: "N/A", definition: "N/A", impact: "N/A", example: "N/A", myths: "N/A", reflection: "N/A")
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text("Vocabulary term of the week:")
                    .font(.custom("Ubuntu", size: 16))
                    .foregroundColor(Color(hex: "#2B2B2B"))
                    .padding(.top, 20)
                
                Text(term.term)
                    .font(.custom("Ubuntu-Medium", size: 16))
                    .foregroundColor(Color.black)
                    .padding(.top, -10.0)
                
                Image("wizard_DEI")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(width: 200.0, height: 200.0)
                    .padding(.vertical, 15.0)
                
                Text("Myths")
                    .font(.custom("Ubuntu", size: 24))
                    .foregroundColor(Color.black)
                    .padding(.bottom, -15.0)
                
                Text("Identify common misconceptions surrounding this term.")
                    .font(.custom("Ubuntu", size: 16))
                    .foregroundColor(Color(hex: "#414141"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .lineSpacing(3)
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 1)
                
                Text(term.myths)
                    .font(.custom("Ubuntu", size: 16))
                    .foregroundColor(Color(hex: "#525454"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 25.0)
                    .lineSpacing(3.0)
                
            }
        }
        .navigationBarTitle("Myths", displayMode: .inline)
    }
}

struct TOTWMythsView_Previews: PreviewProvider {
    static var previews: some View {
        TOTWMythsView()
    }
}
