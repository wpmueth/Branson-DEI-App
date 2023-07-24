//
//  JournalingTipsView.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/22/23.
//

import SwiftUI

struct JournalingTipsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#EEF1FF"))
                        .frame(height: 200)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Image("rocket_DEI")
                        .resizable()
                        .frame(width: 130, height: 130)
                }
                
                Text("Journaling Tips and Tricks")
                    .font(.custom("Ubuntu", size: 26))
                    .foregroundColor(Color.black)
                
                Text("Journaling can be a transformative habit. It can help you clear your mind and explore your thoughts and feelings, and it can also be a great way to record your personal history. However, getting started and keeping up with a journaling habit can be challenging.\n\nHere are some tips and tricks that may help you make journaling a regular and rewarding part of your life.")
                    .font(.custom("Ubuntu", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                    .padding(.bottom)
                
                Text("Embrace Stream-of-Consciousness Writing")
                    .font(.custom("Ubuntu-Bold", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                Text("Starting to journal might feel difficult, especially when you're unsure what to write about. Stream-of-consciousness writing is a technique where you write down your thoughts in the order they come to you, without worrying about grammar, punctuation, or the overall structure. This allows you to freely explore your thoughts and feelings, making it a great way to kick-start your journaling practice.")
                    .font(.custom("Ubuntu", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                    .padding(.bottom)
                
                Text("Write Regularly, Not Perfectly")
                    .font(.custom("Ubuntu-Bold", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                Text("Many people get stuck on trying to make their journal entries perfect. This can make journaling stressful instead of therapeutic. Remember, your journal is for you - it's okay to make mistakes, to rewrite your entry, to not quite understand what you're saying. What's most important is to write regularly, whether that's daily, every other day, or weekly.")
                    .font(.custom("Ubuntu", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                    .padding(.bottom)
                
                Text("Review Your Entries")
                    .font(.custom("Ubuntu-Bold", size: 17))
                    .foregroundColor(Color(hex: "#3B3B3C"))
                Text("One of the most powerful aspects of journaling is the ability to look back on your previous thoughts, feelings, and experiences. Make a habit of occasionally reviewing your past entries. You may gain new insights about yourself and see your personal growth over time.\n\n\nJournaling is a personal journey, and there's no one-size-fits-all approach. Each individual can adapt these tips to suit their preferences and goals. Remember, the key to successful journaling is persistence and self-compassion. Don't stress about getting it 'right'. Instead, focus on the benefits it brings to your mind and spirit. Happy journaling!")
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

struct JournalingTipsView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingTipsView()
    }
}
