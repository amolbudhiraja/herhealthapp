//
//  ContentView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/7/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            VStack {
                TitleView()
                ResourcesView()
                ServiceView()
                
             
                Spacer() //Pushes the title block to the top of the screen.
                TabBarView(bottomPadding: 80)
                
            }
        }        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleButton: View {
    @Environment(\.colorScheme) var colorScheme

    var text: String
    var color: UIColor
    var body: some View {
        VStack{
            Text(text)
                .font(.headline)
                .bold()
                .foregroundColor(.white)
                .padding(.leading, 30)
                .padding(.trailing, 30)
        }.padding(7)
        .background(
            Color(color)
                .cornerRadius(25)
                .padding(.leading)
                .padding(.trailing)
        )
    }
}

struct TitleView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack { //Title Block
            ZStack { //Title Image
                
                HStack {
                    VStack {
                        Text("Her Health First")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text("We empower Black Mothers!")
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.leading, 25)
                        
                        
                    }
                    Image("Logo")
                        .resizable()
                        .padding(10)
                        .background(
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 10)
                        )
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 75)
                    
                    
                }.padding(.top)
            }.frame(width: UIScreen.main.bounds.width, height: 115, alignment: .center) //REMOVE
            .padding(.top, 55)
            HStack {
                NavigationLink(destination: AboutUsView()) {
                TitleButton(text: "About Us", color: #colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1))
                }
                NavigationLink(destination: ContactUsView()) {
                TitleButton(text: "Contact Us", color: #colorLiteral(red: 0.2235294118, green: 0.6561877728, blue: 0.6525040865, alpha: 1))
                }
            }
            .padding(.bottom, 25)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9226487279, green: 0.5432175994, blue: 0.7511717677, alpha: 1)), Color(#colorLiteral(red: 0.9607729316, green: 0.545502007, blue: 0.4201352, alpha: 1))]), startPoint: .top, endPoint: .bottom)
            
        )
        .cornerRadius(25)
        .edgesIgnoringSafeArea(.top)
        .shadow(radius: 10)
    }
}

struct ResourcesBlock: View {
    @Environment(\.colorScheme) var colorScheme

    var imageTxt: String
    var subHeading1: String
    var HeadingMain: String
    var description: String
    var buttonTxt: String
    var buttonColor: UIColor
    var body: some View {
        VStack { //Resources Block
            HStack{
                Text(imageTxt) //A
                    .font(.title)
                    .bold()
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding(25)
                    .background(
                        Circle()
                            .stroke(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)), lineWidth: 5)
                            .padding(2)
                    )
                VStack {
                    HStack {
                        Text(subHeading1) //Blog
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                        Spacer()
                    }
                    HStack {
                        Text(HeadingMain) //Articles
                            .font(.title3)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color(#colorLiteral(red: 0.9342671037, green: 0.6300593615, blue: 0.7783520818, alpha: 1)))
                        Spacer()
                        TitleButton(text: buttonTxt, color: buttonColor) //Blog
                        
                    }
                    HStack {
                        Text(description)
                            .lineLimit(nil)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                        Spacer()
                    }
                }
            }
            
        }.padding()
    }
}

struct ResourcesView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack{
            HStack {
                Text("Checkout our Resources!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding(.leading)
                Spacer()
            }
            NavigationLink(destination: ArticleHomeView()) {

            ResourcesBlock(imageTxt: "A", subHeading1: "Blog", HeadingMain: "Articles", description: "Read our amazing articles with expert advice today!", buttonTxt: "Blog", buttonColor: #colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1))
            }
            NavigationLink(destination: ResourcesHomeView()) {

            ResourcesBlock(imageTxt: "R", subHeading1: "Media", HeadingMain: "Resources", description: "We have many podcasts and videos to help you navigate your pregnancy!", buttonTxt: "Media", buttonColor: #colorLiteral(red: 0.3159432411, green: 0.8177366853, blue: 0.8226850033, alpha: 1))
            }
            }
    }
}

struct ServicesBlock: View {
    @Environment(\.colorScheme) var colorScheme

    var subHeading1: String
    var headingMain: String
    var description: String
    var image: String
    var body: some View {
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
                VStack {
                    
                    HStack {
                        Text(subHeading1) //Blog
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.9318708777, green: 0.6326063871, blue: 0.7780224085, alpha: 1)))
                        Spacer()
                    }
                    HStack {
                        Text(headingMain) //Articles
                            .font(.title3)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                        Spacer()
                    }
                    HStack {
                        Text(description)
                            .lineLimit(nil)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            .padding(.trailing)
                        Spacer()
                    }
                }.padding(.leading, 85).padding()
                HStack{
                    VStack {
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 75)
                            
                        
                    }
                    .border(Color.white, width: 6)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    Spacer()
                }.padding(.leading, 10)
            }
        }.frame(width: 350)
    }
}

struct ServiceView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            HStack {
                Text("Our Services!")
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding(.leading)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    NavigationLink(destination: ServiceDetailView(title: "Doula Care", image: "DoulaCare", description: DoulaCare)) {

                    ServicesBlock(subHeading1: "Personal Care", headingMain: "Doula Care", description: "A doula is a trained professional who supports moms and mom-to-be before, during, and after childbirth.", image: "DoulaCare").padding()
                    }
                    
                    NavigationLink(destination: ServiceDetailView(title: "Lactation Support", image: "LactationSupport", description: LactationSupport)) {
                    ServicesBlock(subHeading1: "Personal Care", headingMain: "Lactation Support", description: "The breastfeeding process can be challenging, but it doesn’t have to be. We connect you with lactation consultants", image: "LactationSupport").padding()
                    }
                    NavigationLink(destination: ServiceDetailView(title: "Health and Wellness", image: "HealthAndWellness", description: HealthAndWellness)) {
                    ServicesBlock(subHeading1: "Healthy Living", headingMain: "Health and Wellness", description: "Our program offers a holistic approach to health which includes meditation, prenatal yoga, and nutrition education to encourage healthy living", image: "LactationSupport").padding()
                }
                    NavigationLink(destination: ServiceDetailView(title: "Mommy Mingles", image: "MommyMingles", description: MommyMingles)) {
                    ServicesBlock(subHeading1: "Community and Support", headingMain: "Mommy Mingles", description: "Sis we’re here for you! Join a community with a no-judgment zone where you feel valued.", image: "MommyMingles").padding()
                    }
                    
                    Button(action: { UIApplication.shared.open(URL(string: "http://blackmothersunited.org/maternity-portraits/")!)}, label: {
                    ServicesBlock(subHeading1: "Photography", headingMain: "Maternity Portraits", description: "The Black Mothers United program is happy to provide you with an opportunity to capture professional maternity photos.", image: "MaternityPortraits").padding()
                    })
                    
                    
                }
                
            }
            
        }
    }
}

struct TabBarView: View {
    @Environment(\.colorScheme) var colorScheme

    var bottomPadding: CGFloat
    var colorServices: UIColor = #colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)
    var colorResources: UIColor = #colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)
    var colorContactUs: UIColor = #colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)
    var colorAboutUs: UIColor = #colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)
    var body: some View {
        VStack{
            ZStack{
                
                if colorScheme == .dark {
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9226487279, green: 0.5432175994, blue: 0.7511717677, alpha: 1)), Color(#colorLiteral(red: 0.9607729316, green: 0.545502007, blue: 0.4201352, alpha: 1))]), startPoint: .top, endPoint: .bottom)

                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.1), radius: 10)
                        .padding(10)
                }
                else {
                    Color.white
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.1), radius: 10)
                    
                }
                 
                HStack{
                    NavigationLink(destination: ServiceHomeView()) {

                    Image(systemName: "heart.text.square")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(colorServices))
                    }
                    NavigationLink(destination: ResourcesHomeView()) {

                    Image(systemName: "book")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(colorResources))
                    
                    }
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "house")
                            .font(.system(size: 55, weight: .semibold))
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.9254901961, green: 0.5457611084, blue: 0.7350085974, alpha: 1)))

                    }
                    NavigationLink(destination: ContactUsView()) {

                    Image(systemName: "phone")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(colorContactUs))

                    }
                    NavigationLink(destination: AboutUsView()) {

                        Image(systemName: "person")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(colorAboutUs))
                        
                    }
                    }.padding(.leading, 10)
                .padding(.trailing, 10)
            }.frame(height: 105).padding(.bottom, bottomPadding).padding(.leading).padding(.trailing)
            
        }
    }
}

