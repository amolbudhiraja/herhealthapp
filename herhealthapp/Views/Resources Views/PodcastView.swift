//
//  PodcastView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/21/21.
//

import SwiftUI

struct PodcastView: View {
    @Environment(\.colorScheme) var colorScheme

    @State var navBarHidden: Bool = true
    @State var podcast_posts: [podcastPost] = []
    @Environment(\.imageCache) var cache: ImageCache
    var body: some View {
        VStack(spacing: 0){
            

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                Text("Our Podcast: Black Maternal Health")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    
                    Button(action: { UIApplication.shared.open(URL(string: "https://blackmothersunited.org/podcast/who-is-her-health-first/")!)}, label: {
                       
                        ZStack{
                                
                                VStack {
                                    Image("PodcastCover")
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
                                        
                                        Text("Who is HER Health First")
                                            .font(.title)
                                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            .bold()
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
                    })
                    

                    
                Text("Other Podcasts!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding()

                    VStack {
                        ForEach(podcast_posts) { podcastposts in
                            VStack{
                                
                                Button(action: { UIApplication.shared.open(URL(string: podcastposts.url)!)}, label: {
                                   
                                    OtherPodcastsView(title: podcastposts.title)
                                    
                                })
                                
                
                            }
                            
                        }
                        
                    }      .onAppear {
                        PodcastAPI().getItems { (podcast_posts) in
                            self.podcast_posts = podcast_posts
                            
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

struct PodcastView_Previews: PreviewProvider {
    static var previews: some View {
        PodcastView()
    }
}

struct OtherPodcastsView: View {
    @Environment(\.colorScheme) var colorScheme

    var title: String
    var body: some View {
        ZStack{
            Color.white
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.3), radius: 10)
                .padding(15)
            
            VStack {
                ZStack{
                    if colorScheme == .dark {
                                           Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1))
                                               .cornerRadius(25)
                                               .shadow(color: Color.black.opacity(0.1), radius: 10)
                                       }
                                       else {
                                           Color.white
                                               .cornerRadius(25)
                                               .shadow(color: Color.black.opacity(0.1), radius: 10)
                                       }
                    HStack{
                        Text(title)
                            .bold()
                            .font(.headline)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)                        
                    }.padding()
                }.frame(width: UIScreen.main.bounds.width - 20)
            }
        }
    }
}
