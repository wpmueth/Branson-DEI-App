//
//  JournalDailyPromptView.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/10/23.
//

import SwiftUI

struct JournalDailyPromptView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented: Bool
    @State private var currentPrompt: JOTD? = nil
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("journaling_photo_DEI")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, alignment: .center)
                
                Text("Journal Prompt of the Day")
                    .font(.custom("Ubuntu", size: 25))
                    .foregroundColor(Color.black)
                    .padding(.top, 5.0)
                
                Rectangle()
                    .fill(Color.black.opacity(0.75))
                    .frame(width: max(0, geometry.size.width - 50), height: 2)
                    .padding(.vertical, 10.0)
                
                Text(currentPrompt?.text ?? "Loading...")
                    .font(.custom("Ubuntu", size: 20))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                    .lineSpacing(8)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                Button(action: {
                    self.isPresented = false
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.gray)
                        .padding()
                },
                alignment: .topTrailing
            )
            .onAppear(perform: loadPrompt)
        }
    }
    
    func loadPrompt() {
        let jotds = loadJOTDs()
        let currentDayOfYear = Calendar.current.ordinality(of: .day, in: .year, for: Date())! - 1
        currentPrompt = jotds[currentDayOfYear % jotds.count]
    }
}

struct JournalDailyPromptView_Previews: PreviewProvider {
    static var previews: some View {
        JournalDailyPromptView(isPresented: .constant(true))
    }
}
