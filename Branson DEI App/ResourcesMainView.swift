//
//  ResourcesMainView.swift
//  Diversity, Equity, and Inclusion App
//
//  Created by William Mueth on 6/10/23.
//

import SwiftUI
import WebKit

struct ResourcesMainView: View {
    @State private var selectedVideo: CarouselData?
    
    var body: some View {
        ScrollView {
            VStack {
                // Resources title
                Text("Resources")
                    .font(.custom("Ubuntu", size: 18))
                    .foregroundColor(Color.black)
                    .padding(.top, 6.0)
                    .padding(.bottom, 20.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // First section
                VStack {
                    // First rectangle
                    Link(destination: URL(string: "https://rz7cc078mqu.typeform.com/to/igZXwd6f")!, label: {
                        HStack {
                            Image("stationery_DEI")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .padding(.leading, 15)
                                .padding(.trailing, 15)
                            VStack(alignment: .leading) {
                                Text("Educational Assessment (ESAT)")
                                    .font(.custom("Ubuntu", size: 18))
                                    .foregroundColor(Color.black)
                                    .padding(.bottom, 1.0)
                                Text("Discover your position in modern society.")
                                    .font(.custom("Ubuntu", size: 15))
                                    .foregroundColor(Color(hex: "#757676"))
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            Spacer()
                        }
                    })
                    .frame(width: 380, height: 95)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.25), radius: 2, x: 0, y: 1)
                    .padding(.horizontal)
                    .padding(.top, 30.0)

                    // Second rectangle
                    HStack {
                        Image("quill_DEI")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                        VStack(alignment: .leading) {
                            Text("Give us your feedback")
                                .font(.custom("Ubuntu", size: 18))
                                .foregroundColor(Color.black)
                                .padding(.bottom, 1.0)
                            Text("Share your feedback to improve our app.")
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
                    .padding(.vertical, 5.0)
                    
                    // Padding to create space at the bottom
                    Spacer().frame(height: 10)
                }
                .background(Color.white)
                .padding(.bottom, 10)

                // Second section
                VStack {
                    Text("Learn more")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#525454"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .leading, .trailing])
                        .padding(.bottom, 10)
                    
                    Image("e3_thumbnail_DEI_final")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 190)
                        .cornerRadius(20)
                        .onTapGesture {
                            selectedVideo = CarouselData.standaloneVideo
                        }
                    
                    // Padding to create space at the bottom
                    Spacer().frame(height: 30)
                }
                .background(Color.white)
                .padding(.bottom, 10)
                
                // Third section
                VStack {
                    Text("Other useful resources")
                        .font(.custom("Ubuntu", size: 17))
                        .foregroundColor(Color(hex: "#525454"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .leading, .trailing])
                    
                    // Carousel
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(CarouselData.list) { video in
                                CarouselCardView(video: video)
                                    .onTapGesture {
                                        self.selectedVideo = video
                                    }
                            }
                        }
                        .padding()
                    }
                    
                    // Padding to create space at the bottom
                    Spacer().frame(height: 10)
                }
                .background(Color.white)
                .padding(.bottom)

                Spacer()
            }
        }
        .background(Color(hex: "#F8F5F0").edgesIgnoringSafeArea(.all))
        .fullScreenCover(item: $selectedVideo) { video in
            VideoPlayerView(url: URL(string: video.videoUrl) ?? URL(string: "https://www.youtube.com")!)
        }
    }
}

struct CarouselCardView: View {
    let video: CarouselData

    var body: some View {
        Image(video.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 150)
            .clipped()
            .cornerRadius(10)
    }
}

struct VideoPlayerView: View {
    let url: URL
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .topLeading) {
            WebView(url: url)
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 24))
                    .padding()
            })
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct CarouselData: Identifiable {
    let id = UUID()
    let imageName: String
    let videoUrl: String

    static let list = [
        CarouselData(imageName: "image_1", videoUrl: "https://www.youtube.com/watch?v=ApBJpVjf9kw"),
        CarouselData(imageName: "image_2", videoUrl: "https://www.youtube.com/watch?v=F1NcWFkIj2c"),
        CarouselData(imageName: "image_3", videoUrl: "https://www.youtube.com/watch?v=Fr8G7MtRNlk")
    ]
    
    static let standaloneVideo = CarouselData(imageName: "e3_thumbnail_DEI_final", videoUrl: "https://www.youtube.com/watch?v=sxTFQcoQ7hs")
}

struct ResourcesMainView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesMainView()
    }
}
