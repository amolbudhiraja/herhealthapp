//
//  ContactUsView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/21/21.
//

import SwiftUI

struct ContactUsView: View {
    @State var navBarHidden: Bool = true
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 0){
            
            ScrollView(.horizontal, showsIndicators: false) {
               
                HStack(spacing: 20) {
                    
                    ContactBlock(topText: "Call Us!", image: "phone.circle", heading: "916-558-4809", webURL: "tel:9165584809").padding(.leading)
                    ContactBlock(topText: "Write to us!", image: "envelope.circle", heading: "Contact Us Form", webURL: "https://blackmothersunited.org/contact-us/")
                    ContactBlock(topText: "Visit our Website!", image: "link.circle", heading: "herhealthfirst.org/", webURL: "http://herhealthfirst.org/")
                    
                    
                }.padding(.top, 30).offset(y: UIScreen.main.bounds.height / 4)
                Spacer(minLength: 350)
            }.overlay(
                VStack {
                    TitleView()
                    Spacer()
                    TabBarView(bottomPadding: 0, colorContactUs: #colorLiteral(red: 0.9592515826, green: 0.5457533002, blue: 0.4279192984, alpha: 1))
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

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}

struct ContactBlock: View {
    @Environment(\.colorScheme) var colorScheme

    var topText: String
    var image: String
    var heading: String
    var webURL: String
    var body: some View {
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
                    Text(topText) //Blog
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(#colorLiteral(red: 0.9318708777, green: 0.6326063871, blue: 0.7780224085, alpha: 1)))
                    
                }
                Image(systemName: image)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .font(.system(size: 180, weight: .regular))
                
                
                HStack {
                    
                    Button(action: { UIApplication.shared.open(URL(string: webURL)!)}, label: {
                            Text(heading) //Articles
                                .font(.title)
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))

                    })
                    
                   
                    
                }
                HStack {
                    Text("Get in touch with our team to start your free services now!")
                        .lineLimit(nil)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                        .padding(.trailing)
                }
            }.padding()
        }.frame(width: UIScreen.main.bounds.width - 50)
    }
}
