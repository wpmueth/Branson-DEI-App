//
//  JournalingBenefitsView.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/22/23.
//

import SwiftUI

struct JournalingBenefitsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#F4E7E7"))
                        .frame(height: 200)
                        .edgesIgnoringSafeArea(.horizontal)
                    
                    Image("brain_DEI")
                        .resizable()
                        .frame(width: 140, height: 140)
                }
                
                Group {
                    Text("Benefits of Journaling")
                        .font(.custom("Ubuntu", size: 26))
                        .foregroundColor(Color.black)
                    
                    Text("Journaling can be a profoundly enriching habit. It allows you to dive deep into your thoughts, emotions, and experiences, acting as a mirror to your inner world. But why exactly should one adopt journaling? Let's delve into some core benefits.")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                }
                
                Group {
                    Text("Enhances Self-Awareness and Mindfulness")
                        .font(.custom("Ubuntu-Bold", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                    Text("Journaling offers a private platform to express your thoughts and feelings, becoming a tool for enhancing self-awareness. As you navigate through your thoughts, patterns in your behavior become more apparent, and emotional responses to events get better understood. Through this exploration, journaling cultivates a heightened state of sensitivity to your environment and experiences.")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                }
                
                Group {
                    Text("Stimulates Creativity")
                        .font(.custom("Ubuntu-Bold", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                    Text("Journaling is a creative endeavor as much as it is a reflective practice. By allowing your thoughts and ideas to flow freely, you stimulate your creative thinking processes and unlock novel perspectives and ideas.")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                }
                
                Group {
                    Text("Supports Emotional Health")
                        .font(.custom("Ubuntu-Bold", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                    Text("Journaling provides an uncensored space to express and process your emotions, contributing to improved emotional health. It allows you to manage stress, anxiety, and complex emotions through written expression. By revisiting past entries, you gain a unique perspective on your emotional journey, fostering a greater sense of self-worth, and emotional resilience.")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#3B3B3C"))
                        .padding(.bottom)
                }
                
                Text("In conclusion, journaling is a journey of self-discovery and personal growth, not merely a daily task. As you explore the practice, you'll find yourself developing in ways beyond imagination. Embrace the process, and enjoy the transformative power of journaling.")
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

struct JournalingBenefitsView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingBenefitsView()
    }
}
