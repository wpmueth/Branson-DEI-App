//
//  ContentView.swift
//  Diversity, Equity, and Inclusion App
//
//  Created by William Mueth on 6/10/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ScrollView {    //maybe can delete
                VStack {
                    Text("Home")
                        .font(.custom("Ubuntu-Regular", size: 18))
                        .foregroundColor(Color.black)
                        .padding(.top, 6.0)

                    Text("Hello Kasra!") //need to use user input here to figure out their name
                        .font(.custom("Ubuntu-Regular", size: 35))
                        .foregroundColor(Color.black)
                        .padding(.top, 10.0)

                    Rectangle()
                        .fill(Color(hex: "#142C8E"))
                        .frame(width: 225, height: 2)
                        .padding(.bottom, 25.0)
                        

                    NavigationLink(destination: CaseScenarioList()) {
                        Spacer()
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.white)
                                .frame(width: 340, height: 160, alignment: .center)
                                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("New Case Scenario")
                                            .font(.custom("Ubuntu-Regular", size: 24))
                                            .foregroundColor(Color.black)
                                        
                                        Rectangle()
                                            .fill(Color(hex: "#142C8E"))
                                            .frame(width: 250, height: 2)
                                    }
                                    Spacer()
                                }
                                
                                Text("Here you can experience new situations to boost your awareness.")
                                    .font(.custom("Ubuntu-Regular", size: 14))
                                    .foregroundColor(Color(hex: "#525454"))
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 5)
                            }.padding(.horizontal)
                        }
                        .padding(.horizontal)
                    }
                    

                    NavigationLink(destination: ScenarioCreationView()) {
                        Text("How we created our scenarios")
                            .font(.custom("Ubuntu-Bold", size: 17))
                            .foregroundColor(Color(hex: "#0F73EA"))
                            .padding(.top, 20.0)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .frame(width: 340, height: 155, alignment: .center)
                            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 2, y: 2)

                        VStack {
                            HStack {
                                Image("Diversity_Icon_DEI")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 65)

                                VStack(alignment: .leading, spacing: 5) {
                                    Text("DEI Overview")
                                        .font(.custom("Ubuntu-Regular", size: 17))
                                        .foregroundColor(Color.black)
                                        .padding(.bottom, 4.0)

                                    Text("Explanation of DEI and its role in society")
                                        .font(.custom("Ubuntu-Regular", size: 13))
                                        .foregroundColor(Color(hex: "#525454"))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.leading, 0.0)
                            }
                            .padding(.bottom, 5.0)
                            

                        

                            NavigationLink(destination: DEIOverviewView()) {
                                Text("Learn More")
                                    .font(.custom("Ubuntu-Regular", size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 35)
                                    .padding(.vertical, 10)
                                    .background(Color(hex: "#142C8E"))
                                    .cornerRadius(40)
                            }
                            .padding(.bottom, 20.0)
                        }
                        
                    }
                    .padding(.top, 30.0)
                }
            }
            .background(Color(hex: "#F8F5F0").edgesIgnoringSafeArea(.top))

        }
    }
}
// for the simulator on the right
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
