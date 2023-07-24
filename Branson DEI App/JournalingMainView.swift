//
//  JournalingMainView.swift
//  Diversity, Equity, and Inclusion App
//
//  Created by William Mueth on 6/10/23.
//

import SwiftUI
import CoreData

struct JournalingMainView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var isPresentingPrompt = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Journal")
                        .font(.custom("Ubuntu", size: 18))
                        .foregroundColor(Color.black)
                        .padding(.top, 6.0)

                    ZStack {
                        VStack {
                            Spacer()

                            Image("pencil_writing_DEI")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .padding(.bottom, 10.0)
                            
                            Text("Write a new journal entry here")
                                .font(.custom("Ubuntu", size: 18))
                                .foregroundColor(Color.black)
                                .padding(.bottom, 8.0)
                            
                            NavigationLink(destination: NewEntryView().environment(\.managedObjectContext, self.viewContext)) {
                                Text("New Entry")
                                    .font(.custom("Ubuntu", size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 35)
                                    .padding(.vertical, 10)
                                    .background(Color(hex: "#142C8E"))
                                    .cornerRadius(40)
                            }
                            .padding(.bottom, 20)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                        .background(Color.white)
                        Spacer()
                    }
                    .padding(.top, 15)

                    ZStack {
                        VStack(alignment: .leading) {
                            Text("Recent Activity")
                                .font(.custom("Ubuntu", size: 17))
                                .foregroundColor(Color(hex: "#525454"))
                                .padding(.bottom, 20)

                            HStack {
                                Image("calendar_DEI")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 65)
                                    .padding(.leading, 20)

                                VStack(alignment: .leading, spacing: 5) {
                                    Text("View previous entries")
                                        .font(.custom("Ubuntu", size: 18))
                                        .foregroundColor(Color.black)
                                        .padding(.bottom, 3.0)

                                    Text("Previous entries will appear here")
                                        .font(.custom("Ubuntu", size: 16))
                                        .foregroundColor(Color(hex: "#525454"))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.leading, 10.0)
                            }
                            .padding(.bottom, 15)

                            NavigationLink(destination: EntriesListView().environment(\.managedObjectContext, self.viewContext)) {
                                Text("Show All")
                                    .font(.custom("Ubuntu-Bold", size: 17))
                                    .foregroundColor(Color(hex: "#0F73EA"))
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                        .background(Color.white)
                    }
                    .padding(.top, 10.0)

                    ZStack {
                        VStack(alignment: .leading) {
                            Text("Journaling Resources")
                                .font(.custom("Ubuntu", size: 17))
                                .foregroundColor(Color(hex: "#525454"))
                                .padding(.bottom, 20)
                                .padding(.leading, 10)

                            Button(action: {
                                self.isPresentingPrompt = true
                            }) {
                                HStack(alignment: .center) {
                                    Image("study_DEI")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .padding(.leading, 15)
                                        .padding(.trailing, 15)
                                    VStack(alignment: .leading) {
                                        Text("Daily Journal Prompt")
                                            .font(.custom("Ubuntu", size: 18))
                                            .foregroundColor(Color.black)
                                            .padding(.bottom, 1.0)
                                        Text("View the prompt of the day and reflect.")
                                            .font(.custom("Ubuntu", size: 15))
                                            .foregroundColor(Color(hex: "#757676"))
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    Spacer()
                                }
                                .frame(width: 380, height: 95)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 1)
                                .padding(.horizontal)
                            }
                            .sheet(isPresented: $isPresentingPrompt) {
                                JournalDailyPromptView(isPresented: self.$isPresentingPrompt)
                                    .environment(\.managedObjectContext, self.viewContext)
                            }
                            .padding(.bottom, 10)

                            NavigationLink(destination: JournalingTipsView()) {
                                HStack(alignment: .center) {
                                    Image("rocket_DEI")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .padding(.leading, 15)
                                        .padding(.trailing, 15)
                                    VStack(alignment: .leading) {
                                        Text("Tips and Tricks")
                                            .font(.custom("Ubuntu", size: 18))
                                            .foregroundColor(Color.black)
                                            .padding(.bottom, 1.0)
                                        Text("Learn effective journaling strategies.")
                                            .font(.custom("Ubuntu", size: 15))
                                            .foregroundColor(Color(hex: "#757676"))
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    Spacer()
                                }
                                .frame(width: 380, height: 95)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 1)
                                .padding(.horizontal)
                            }
                            .padding(.bottom, 10)

                            NavigationLink(destination: JournalingListView()) {
                                HStack(alignment: .center) {
                                    Image("light-bulb")
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .padding(.leading, 15)
                                        .padding(.trailing, 15)
                                    VStack(alignment: .leading) {
                                        Text("List of Topics")
                                            .font(.custom("Ubuntu", size: 18))
                                            .foregroundColor(Color.black)
                                            .padding(.bottom, 1.0)
                                        Text("Get inspired by a variety of prompts.")
                                            .font(.custom("Ubuntu", size: 15))
                                            .foregroundColor(Color(hex: "#757676"))
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    Spacer()
                                }
                                .frame(width: 380, height: 95)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 1)
                                .padding(.horizontal)
                            }
                            .padding(.bottom, 10)
                            
                            NavigationLink(destination: JournalingBenefitsView()) {
                                HStack(alignment: .center) {
                                    Image("brain_DEI")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .padding(.leading, 15)
                                        .padding(.trailing, 15)
                                    VStack(alignment: .leading) {
                                        Text("Benefits of Journaling")
                                            .font(.custom("Ubuntu", size: 18))
                                            .foregroundColor(Color.black)
                                            .padding(.bottom, 1.0)
                                        Text("Reveal the perks of daily reflection.")
                                            .font(.custom("Ubuntu", size: 15))
                                            .foregroundColor(Color(hex: "#757676"))
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    Spacer()
                                }
                                .frame(width: 380, height: 95)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 1)
                                .padding(.horizontal)
                            }
                            .padding(.bottom, 10)
                        }
                        .padding(15)
                        .background(Color.white)
                    }
                    .padding(.top, 10)
                }
            }
            .background(Color(hex: "#F8F5F0").edgesIgnoringSafeArea(.top))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct JournalingMainView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingMainView()
    }
}
