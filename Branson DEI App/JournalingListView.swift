//
//  JournalingListView.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/22/23.
//

import SwiftUI

struct JournalingListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#F8F4E9"))
                        .frame(height: 200)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Image("light-bulb")
                        .resizable()
                        .frame(width: 140, height: 140)
                }
                
                Group {
                    Text(" Topics to Write About")
                        .font(.custom("Ubuntu", size: 26))
                        .foregroundColor(Color.black)
                    
                    Text("When sitting at an empty journal, it's often helpful to have some topics or prompts to guide your writing. Whether you're new to journaling or an experienced writer looking for fresh inspiration, here's a list of ideas to spark your thoughts and emotions.")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                    
                    Text("Daily Reflections")
                        .font(.custom("Ubuntu-Bold", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom, -5)
                    Text("What was the best part of your day?\nDid anything surprise you today?\nWhat's something you learned today?")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                    
                }
                
                Group {
                    Text("Gratitude Prompts")
                        .font(.custom("Ubuntu-Bold", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom, -5)

                    Text("What are three things you're grateful for today?\nWrite about a person who has positively impacted your life.\nDescribe a recent experience that brought you joy.")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                    
                    Text("Dreams and Goals")
                        .font(.custom("Ubuntu-Bold", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom, -5)

                    Text("Write down a dream you had last night.\nWhat's a personal goal you'd like to achieve in the next year?\nImagine your ideal day. What would it look like?")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                }
                
                Group {
                    Text("Thought-Provoking Questions")
                        .font(.custom("Ubuntu-Bold", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom, -5)
                    Text("If you could have dinner with anyone, living or dead, who would it be and why?\nWhat's something you've always wanted to do, and what's holding you back?\nIf money and time were no object, what would you do?")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                    
                    Text("Personal Growth and Self-Reflection")
                        .font(.custom("Ubuntu-Bold", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom, -5)
                    Text("What is a challenge you've recently overcome, and what did it teach you?\nWrite about a time when you felt proud of yourself.\nReflect on a mistake you made and what you learned from it.\n\n\nEach of these prompts is designed to help you delve deeper into your thoughts, feelings, and experiences. Remember, there are no right or wrong answers in your journal. The purpose is to explore, understand, and express yourself more fully.")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct JournalingListView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingListView()
    }
}
