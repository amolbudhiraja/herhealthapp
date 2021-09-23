//
//  ArticleHomeView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/19/21.
//

import SwiftUI

struct ArticleHomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var navBarHidden: Bool = true
    @State var posts: [Post] = []
    @Environment(\.imageCache) var cache: ImageCache
    let featuredPostBody: String = "It’s common to feel like you are in the dark about the many changes that take place throughout the pregnancy experience and to feel unsupported, but help is available\nRaise your hand if you’re pregnant or already birthed your baby and are learning so many things about your body and this thing called motherhood. Yep! I see you. You are not alone. I’m sure it would relieve you if you had more help or knew more about what to expect. And I’m not just talking about people explaining to you how they raised their children.\nFor instance, many expecting mothers receive unsolicited advice. Suddenly, even those without children are professors on pregnancy 101 and expect you to listen to them.\nHowever, there is solid advice that you should take, and that is from medical professionals and those who have received extensive training in all things regarding pregnant women.\nStudies show that African American women feel most comfortable receiving advice from their mothers and grandmothers. The assurance of family members can shift your experience for the better, but what if you don’t have a family to rely on? Many Black women are turning to doulas amid the maternal mortality rate crisis.\nA doula is a trained companion who supports women through the duration of their pregnancy and after childbirth. They provide support where it may be lacking and advocate for your needs even when receiving treatment from medical professionals.\nThere wouldn’t even be a maternal mortality rate crisis if doctors were getting it right. So, the next best thing has proven to be doulas. Doulas and their knowledge of the labor and delivery process and pregnancy as a whole make all the difference in women’s outcomes. They increase the chance for mother and baby to live healthy and happy.\nWhile doulas don’t solve all the trauma, implicit bias, and daily stressors in African American’s lives, they help improve the pregnancy experience. I know asking for help is not something that most people feel comfortable with, but it is imperative for a positive outcome."
    var body: some View {
        VStack(spacing: 0){
            

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                Text("Featured Article")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    NavigationLink(destination: ArticleDetailView(postBody: featuredPostBody, postTitle: "I Wish I Had More Help", postImage: "https://blackmothersunited.org/wp-content/uploads/2021/07/Picture3-1.jpg", postURL: "http://blackmothersunited.org/uncategorized/i-wish-i-had-more-help/")) { //ADD FEATURED ARTICLE

                    FeaturedArticleView()
                    }
                Text("Other Articles!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding()
                    VStack {
                        ForEach(posts) { blogposts in
                            VStack{
                                NavigationLink(destination: ArticleDetailView(postBody: blogposts.content_text, postTitle: blogposts.title, postImage: blogposts.image, postURL: blogposts.url)) {
                                OtherArticlesBlock(title: blogposts.title, description: blogposts.content_text, image: blogposts.image)
                                }
                
                            }
                            
                        }
                        
                    }      .onAppear {
                        BlogAPI().getItems { (posts) in
                            self.posts = posts
                            
                        }
                    }
                    
//                    OtherArticlesBlock(title: "5 Facts About Breastfeeding", description: "Things you may find surprising about breastfeeding", image: "BlogImage1")
                  Spacer(minLength: 325)
                } .offset(y: UIScreen.main.bounds.height / 4)
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

struct ArticleHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleHomeView()
    }
}


struct FeaturedArticleView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
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
                    
                    Text("I Wish I Had More Help")
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
    }
}

struct OtherArticlesBlock: View {
    @Environment(\.colorScheme) var colorScheme
    var title: String = ""
    var description: String = ""
    var image: String = "https://blackmothersunited.org/wp-content/uploads/2021/07/Picture2.jpg"
    @Environment(\.imageCache) var cache: ImageCache
    var body: some View {
        ZStack(alignment: .center){
            Color.white
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.3), radius: 10)
                .padding(15)
            
            VStack(alignment: .center) {
                ZStack(alignment: .center){
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
                        AsyncImage(url: URL(string: image)!,  cache: self.cache, placeholder: Text("Loading ..."), configuration: { $0.resizable()})
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 40)
                        Text(title)
                            .bold()
                            .font(.headline)
                            .lineLimit(nil)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                            
                        Spacer()
                        
                    }.padding(15)
                }.frame(width: UIScreen.main.bounds.width - 10)
            }
        }
    }
}
