//
//  ResourcesHomeView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/21/21.
//

import SwiftUI

struct ResourcesHomeView: View {
    @State var navBarHidden: Bool = true
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 0){
            

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                Text("Featured Resource")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    NavigationLink(destination: ArticleHomeView()) {
                        
                        ZStack{
                            
                            VStack {
                                Image("BlogImage1")
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
                                    
                                    Text("Blog")
                                        .font(.title)
                                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        .bold()
                                }
                                
                                HStack {
                                    Spacer()
                                    
                                    Text("Read our amazing articles!")
                                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        .font(.headline)
                                }
                                
                                
                                
                            }.padding(30)
                        }
                            
                        
                    }
                Text("Other Resources!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding()
                    NavigationLink(destination: PodcastView()) {

                    OtherResourcesView(resourceTitle: "Podcasts", color: #colorLiteral(red: 0.9284504056, green: 0.5457601547, blue: 0.7060402036, alpha: 1)).padding(.bottom)
                    }
                    NavigationLink(destination: VideoView()) {
                    OtherResourcesView(resourceTitle: "Videos", color: #colorLiteral(red: 0.9592515826, green: 0.545753479, blue: 0.4359562993, alpha: 1))
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

struct ResourcesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesHomeView()
    }
}

struct OtherResourcesView: View {
    @Environment(\.colorScheme) var colorScheme

    var resourceTitle: String
    var color: UIColor
    var body: some View {
        ZStack{
            if colorScheme == .dark {
                                   Color(color)
                                       .cornerRadius(25)
                                       .shadow(color: Color.black.opacity(0.3), radius: 10)
                                    .padding(.leading)
                                    .padding(.trailing)
                                
                               }
                               else {
                                   Color.white
                                       .cornerRadius(25)
                                       .shadow(color: Color.black.opacity(0.3), radius: 10)
                                    .padding(.leading)
                                    .padding(.trailing)
                                
                               }
            
            
            
            VStack{
                Text(resourceTitle)
                    .font(.title)
                    .bold()
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(color))
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}
