//
//  ArticleDetailView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/19/21.
//

import SwiftUI

struct ArticleDetailView: View {
    @Environment(\.colorScheme) var colorScheme

    var postBody: String
    var postTitle: String
    var postImage: String
    var postURL: String
    @State var navBarHidden: Bool = true
    @Environment(\.imageCache) var cache: ImageCache

    var body: some View {
        VStack(spacing: 0){
            

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                Text(postTitle)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    AsyncImage(url: URL(string: postImage)!,  cache: self.cache, placeholder: Text("Loading ..."), configuration: { $0.resizable()})
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.3), radius: 10)
                        .padding()
                    Text(postBody.replacingOccurrences(of: "\n\n\n", with: "\n").replacingOccurrences(of: "&#8217;", with: ""))
                    .multilineTextAlignment(.center)
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .lineLimit(nil)
                    .padding(.trailing)
                    .padding(.leading)
                }

                .offset(y: UIScreen.main.bounds.height / 4)
                Spacer(minLength: 325)
            }
            
            .overlay(
                VStack {
                    TitleView()
                    Spacer()
                    TabBarView(bottomPadding: 0, colorResources: #colorLiteral(red: 0.9592515826, green: 0.5457533002, blue: 0.4279192984, alpha: 1))
                }
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

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(postBody: "", postTitle: "", postImage: "", postURL: "")
    }
}
