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

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Journal")
                        .font(.custom("Ubuntu-Regular", size: 18))
                        .foregroundColor(Color.black)
                        .padding(.top, 6.0)

                    ZStack {
                        VStack {
                            Spacer()

                            Image("Notebook_and_Pencil_DEI")
                                .resizable()
                                .padding(.vertical, 5.0)
                                .scaledToFit()
                                .frame(height: 120)
                            
                            Text("Write a new journal entry here")
                                .font(.custom("Ubuntu-Regular", size: 18))
                                .foregroundColor(Color.black)
                                .padding(.bottom, 8.0)
                            
                            NavigationLink(destination: NewEntryView().environment(\.managedObjectContext, self.viewContext)) {
                                Text("New Entry")
                                    .font(.custom("Ubuntu-Regular", size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 35)
                                    .padding(.vertical, 10)
                                    .background(Color(hex: "#142C8E"))
                                    .cornerRadius(40)
                            }
                            .padding(.bottom, 20)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, height: 250, alignment: .center)
                        .background(Color.white)
                        Spacer()
                    }

                    .padding(.top, 35)
                    
                    ZStack {
                        VStack(alignment: .leading) {
                            Text("Recent Activity")
                                .font(.custom("Ubuntu-Regular", size: 17))
                                .foregroundColor(Color(hex: "#525454"))
                                .padding(.bottom, 20)

                            HStack {
                                Image("Journal_Log_DEI")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 65)

                                VStack(alignment: .leading, spacing: 5) {
                                    Text("View previous entries")
                                        .font(.custom("Ubuntu-Regular", size: 17))
                                        .foregroundColor(Color.black)
                                        .padding(.bottom, 4.0)

                                    Text("Previous entries you made will appear here")
                                        .font(.custom("Ubuntu-Regular", size: 13))
                                        .foregroundColor(Color(hex: "#525454"))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.leading, 10.0)
                            }
                            .padding(.bottom, 20)

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
                    .padding(.top, 30.0)
                }
            }
            .background(Color(hex: "#F8F5F0").edgesIgnoringSafeArea(.top))
           
        }
    }
}

struct JournalingMainView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingMainView()
    }
}
