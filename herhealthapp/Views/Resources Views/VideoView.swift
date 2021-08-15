//
//  VideoView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/21/21.
//

import SwiftUI

struct VideoView: View {
    @Environment(\.colorScheme) var colorScheme

    @State var navBarHidden: Bool = true
    @State var video_posts: [videoPost] = []
    @Environment(\.imageCache) var cache: ImageCache
    var body: some View {
        VStack(spacing: 0){
            

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                Text("Featured Video!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))

                    Button(action: { UIApplication.shared.open(URL(string: "https://blackmothersunited.org/video/creating-reference-episode-1/")!)}, label: {
                       
                        FeaturedVideoView()
                        
                    })
                        
                    
                Text("Other Videos!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding()

                    VStack {
                        ForEach(video_posts) { videoposts in
                            VStack{
                                
                                Button(action: { UIApplication.shared.open(URL(string: videoposts.url)!)}, label: {
                                   
                                    OtherPodcastsView(title: videoposts.title)
                                    
                                })
                                
                
                            }
                            
                        }
                        
                    }      .onAppear {
                        VideoAPI().getItems { (video_posts) in
                            self.video_posts = video_posts
                            
                        }
                    }
                    
                    
                   Spacer(minLength: 325)
                }.offset(y: UIScreen.main.bounds.height / 4)
            }.overlay(
                VStack {
                    TitleView()
                    Spacer()
                    TabBarView(bottomPadding: 0, colorResources: #colorLiteral(red: 0.9592515826, green: 0.5457533002, blue: 0.4279192984, alpha: 1))
                }
            //Spacer()
        )
        }
        .navigationBarTitle("")
                .navigationBarHidden(self.navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    self.navBarHidden = true
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    self.navBarHidden = false
                }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}

struct FeaturedVideoView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack{
            
            VStack {
                Image("VideoThumbnail")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(25)
                    .blur(radius: 2)
                    .shadow(color: Color.black.opacity(0.3), radius: 10)
                    .padding(15)
                
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    Text("Creating Reference Episode 1")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Spacer()
                    
                    Text("June 22, 2021")
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .font(.headline)
                }
                
                
                
            }.padding(30)
        }
    }
}
