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
            VStack(alignment: .center) {
                Text("Resources")
                    .font(.custom("Ubuntu-Regular", size: 18))
                    .foregroundColor(Color.black)
                    .padding(.top, 6.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // First rectangle
                HStack {
                    Image("Survey_DEI")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding([.bottom, .trailing])
                    VStack(alignment: .leading) {
                        Text("Reflect on your experiences")
                            .font(.custom("Ubuntu-Regular", size: 17))
                            .foregroundColor(Color.black)
                            .padding(.bottom, 1.0)
                        Text("Take a second to fill out the following survey")
                            .font(.custom("Ubuntu-Regular", size: 13))
                            .foregroundColor(Color(hex: "#757676"))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .frame(width: 360, height: 95)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding(.top, 30.0)
                
                // Second rectangle
                HStack {
                    Image("Pencil_DEI")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding([.bottom, .trailing])
                    VStack(alignment: .leading) {
                        Text("Give us your feedback")
                            .font(.custom("Ubuntu-Regular", size: 17))
                            .foregroundColor(Color.black)
                            .padding(.bottom, 1.0)
                        Text("Fill out the form here to give us any feedback")
                            .font(.custom("Ubuntu-Regular", size: 13))
                            .foregroundColor(Color(hex: "#757676"))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .frame(width: 360, height: 95)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                .padding(.vertical, 5.0)
                
                Text("Learn more")
                    .font(.custom("Ubuntu-Regular", size: 17))
                    .foregroundColor(Color(hex: "#525454"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .leading, .trailing])
                
                Image("Thumbnail_DEI")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
                
                Text("Other useful resources")
                    .font(.custom("Ubuntu-Regular", size: 17))
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
                
                Spacer()
            }
        }
        .background(Color(hex: "#F8F5F0").edgesIgnoringSafeArea(.all))
        .fullScreenCover(item: $selectedVideo) { video in
            VideoPlayerView(url: URL(string: video.videoUrl))
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
    let url: URL?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack(alignment: .topLeading) {
            if let url = url {
                WebView(url: url)
            }

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
        CarouselData(imageName: "image_1", videoUrl: "https://www.youtube.com/watch?v=51CHNtNlFR8"),
        CarouselData(imageName: "image_2", videoUrl: "https://www.youtube.com/watch?v=6Gv-GYOf0KI"),
        CarouselData(imageName: "image_3", videoUrl: "https://www.youtube.com/watch?v=AiQT6_u7qm0")
    ]
}
