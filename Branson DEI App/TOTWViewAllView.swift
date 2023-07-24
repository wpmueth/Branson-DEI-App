//
//  TOTWViewAllView.swift
//  Branson DEI App
//
//  Created by William Mueth on 7/2/23.
//

import SwiftUI

struct TOTWViewAllView: View {
    // Struct for carousel data
    struct CarouselData2 {
        let image: String
        let text1: String
        let text2: String
    }
    
    // Carousel data
    let carouselData2 = [
        CarouselData2(image: "crocodile_DEI", text1: "Definition", text2: "Learn the meaning"),
        CarouselData2(image: "loudspeaker_DEI", text1: "Impact", text2: "Understand its effects"),
        CarouselData2(image: "jigsaw_DEI", text1: "Examples", text2: "Explore practical instances"),
        CarouselData2(image: "wizard_DEI", text1: "Myths", text2: "Identify common misconceptions"),
        CarouselData2(image: "think-out-of-the-box", text1: "Reflection", text2: "Contemplate your understanding")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("All Views")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 30.0)
                    .padding([.leading, .bottom], 15)

                ForEach(0..<3) { row in
                    HStack {
                        ForEach(0..<2) { column in
                            if row * 2 + column < carouselData2.count {
                                ZStack {
                                    NavigationLink(destination: getViewForTag(tag: row * 2 + column)) {
                                        VStack {
                                            Image(carouselData2[row * 2 + column].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 75, height: 75)
                                                .clipped()

                                            Text(carouselData2[row * 2 + column].text1)
                                                .font(.custom("Ubuntu-Medium", size: 15))
                                                .foregroundColor(Color.black)

                                            Text(carouselData2[row * 2 + column].text2)
                                                .font(.custom("Ubuntu", size: 12))
                                                .foregroundColor(Color(hex: "#2B2B2B"))
                                        }
                                        .frame(width: 150, height: 175)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.white)
                                                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 2, y: 2)
                                        )
                                    }
                                }
                                .padding(.all, 10)
                            } else if row < 2 {
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    func getViewForTag(tag: Int) -> some View {
        switch tag {
        case 0:
            return AnyView(TOTWDefinitionView())
        case 1:
            return AnyView(TOTWImpactView())
        case 2:
            return AnyView(TOTWExamplesView())
        case 3:
            return AnyView(TOTWMythsView())
        case 4:
            return AnyView(TOTWReflectionView())
        default:
            return AnyView(Text("Not found"))
        }
    }
}

struct TOTWViewAllView_Previews: PreviewProvider {
    static var previews: some View {
        TOTWViewAllView()
    }
}
