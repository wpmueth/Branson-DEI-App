//
//  ContentView.swift
//  Diversity, Equity, and Inclusion App
//
//  Created by William Mueth on 6/10/23.
//

import SwiftUI

struct DashboardView: View {
    // Struct for carousel data
    
    struct CarouselData: Identifiable, Equatable {
        let id = UUID() // Adds a unique identifier for each instance
        let image: String
        let text1: String
        let text2: String
        
        static func ==(lhs: CarouselData, rhs: CarouselData) -> Bool {
            return lhs.id == rhs.id
        }
    }

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

    // Carousel data
    let carouselData = [
        CarouselData(image: "crocodile_DEI", text1: "Definition", text2: "Learn the meaning"),
        CarouselData(image: "loudspeaker_DEI", text1: "Impact", text2: "Understand its effects"),
        CarouselData(image: "jigsaw_DEI", text1: "Examples", text2: "Explore practical instances"),
        CarouselData(image: "wizard_DEI", text1: "Myths", text2: "Identify common misconceptions"),
        CarouselData(image: "think-out-of-the-box", text1: "Reflection", text2: "Contemplate your understanding")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Home")
                        .font(.custom("Ubuntu", size: 18))
                        .foregroundColor(Color.black)
                        .padding(.top, 6.0)

                    Text("Hello User!")
                        .font(.custom("Ubuntu", size: 35))
                        .foregroundColor(Color.black)
                        .padding(.top, 10.0)

                    Rectangle()
                        .fill(Color(hex: "#142C8E"))
                        .frame(width: 225, height: 2)
                        .padding(.bottom, 25.0)

                    
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.white)
                                .frame(width: 370, height: 160, alignment: .center)
                                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2)
                                .opacity(0.5)

                            ZStack {
                                        Image("coming_soon_DEI_3")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350, height: 140) // Adjust as necessary to fit the banner properly
                                            .opacity(0.4) // Optional: Change this value to adjust the opacity of the banner
                                    }

                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("New Case Scenario")
                                            .font(.custom("Ubuntu", size: 25))
                                            .foregroundColor(Color.black)
                                            .opacity(0.5)

                                        Rectangle()
                                            .fill(Color(hex: "#142C8E"))
                                            .frame(width: 250, height: 2)
                                            .opacity(0.5)
                                    }
                                }

                                Text("Here you can experience new situations to boost your awareness.")
                                    .font(.custom("Ubuntu", size: 16))
                                    .foregroundColor(Color(hex: "#525454"))
                                    .multilineTextAlignment(.leading)
                                    .padding([.top, .trailing], 5)
                                    .opacity(0.5)
                 

                            }
                            .padding(.horizontal, 10)
                            
                        }
                        .padding(.horizontal)
                    }

                    NavigationLink(destination: ScenarioCreationView()) {
                        Text("How we created our scenarios")
                            .font(.custom("Ubuntu-Bold", size: 17))
                            .foregroundColor(Color(hex: "#0F73EA"))
                            .padding(.top, 15)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .frame(width: 360, height: 140, alignment: .center)
                            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2)
                        
                        VStack {
                            HStack {
                                Image("world_DEI")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 50)
                                    .padding(.trailing, 10)

                                VStack(alignment: .leading, spacing: 5) {
                                    Text("DEI Overview")
                                        .font(.custom("Ubuntu", size: 18))
                                        .foregroundColor(Color.black)
                                        .padding(.bottom, 3.0)

                                    Text("Explanation of DEI and its role in society")
                                        .font(.custom("Ubuntu", size: 14))
                                        .foregroundColor(Color(hex: "#525454"))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .padding(.bottom, 8)

                            NavigationLink(destination: DEIOverviewView()) {
                                Text("Learn More")
                                    .font(.custom("Ubuntu", size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 35)
                                    .padding(.vertical, 10)
                                    .background(Color(hex: "#142C8E"))
                                    .cornerRadius(40)
                            }
                            .padding(.bottom, 5)
                        }
                    }
                    .padding(.top, 20)

                    ZStack {
                        Color.white
                            .frame(maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.bottom)

                        VStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Vocabulary term of the week:")
                                    .font(.custom("Ubuntu", size: 16))
                                    .foregroundColor(Color(hex: "#2B2B2B"))
                                    .padding(.top, 20)
                                    .padding(.horizontal, 15)
                                Text(term.term)
                                    .font(.custom("Ubuntu-Medium", size: 18))
                                    .foregroundColor(Color.black)
                                    .padding(.bottom, 5)
                                    .padding(.horizontal, 15)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(carouselData) { item in
                                        NavigationLink(destination: destinationView(index: carouselData.firstIndex(of: item) ?? 0)) {
                                            VStack {
                                                Image(item.image)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 75, height: 75)
                                                    .clipped()

                                                Text(item.text1)
                                                    .font(.custom("Ubuntu-Medium", size: 15))
                                                    .foregroundColor(Color.black)
                                                    .frame(maxWidth: .infinity)

                                                Text(item.text2)
                                                    .font(.custom("Ubuntu", size: 13))
                                                    .foregroundColor(Color(hex: "#2B2B2B"))
                                                    .frame(maxWidth: .infinity)
                                                    .padding(.top, -8)
                                                
                                            }
                                            .frame(width: 150, height: 175)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.white)
                                                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 2, y: 2)
                                            )
                                        }
                                    }
                                }
                                .padding(.horizontal, 5)
                                .padding(.vertical, 5)
                            }
                            .padding(.top, 10)

                            NavigationLink(destination: TOTWViewAllView()) {
                                Text("View all")
                                    .font(.custom("Ubuntu-Bold", size: 17))
                                    .foregroundColor(Color(hex: "#0F73EA"))
                                    .padding(.vertical, 30)
                            }
                            .padding(.bottom, 20)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 10)

                }
            }
            .background(Color(hex: "#F8F5F0").edgesIgnoringSafeArea(.top))
        }
    }

    @ViewBuilder
    private func destinationView(index: Int) -> some View {
        switch index {
        case 0:
            TOTWDefinitionView()
        case 1:
            TOTWImpactView()
        case 2:
            TOTWExamplesView()
        case 3:
            TOTWMythsView()
        case 4:
            TOTWReflectionView()
        default:
            Text("This view is not yet implemented")
        }
    }


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
