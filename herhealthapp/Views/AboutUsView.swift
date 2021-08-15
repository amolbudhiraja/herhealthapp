//
//  AboutUsView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/21/21.
//

import SwiftUI

struct AboutUsView: View {
    @Environment(\.colorScheme) var colorScheme

    @State var navBarHidden: Bool = true
    var body: some View {
        VStack(spacing: 0){
            

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                Text("About HER Health First")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding(.bottom)
                Text("We are a team of African American mothers dedicated to enhancing healthy birth outcomes for African American women and their babies. Her Health First’s mission is to improve health equity by providing support to pregnant African American women in Sacramento County.")
                      .multilineTextAlignment(.center)
                      .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                      .lineLimit(nil)
                      .padding(.trailing)
                      .padding(.leading)
                        
                        ZStack{
                            
                            VStack {
                                Image("FounderImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(25)
                                    .shadow(color: Color.black.opacity(0.3), radius: 10)
                                    .padding(15)
                                
                            Text("Kenya is the Founder and Program Director of Black Mothers United (BMU), a Her Health First (HHF) program dedicated to reducing the high infant mortality rate amongst Black babies. She’s been with the agency since the year 2000.")
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                                  .lineLimit(nil)
                                  .padding(.trailing)
                                  .padding(.leading)
                                
                            }
                            

                        }
                        
                        
                    
                    Text("Our Benefits")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                        .padding(.top)
                        .padding(.bottom)
                        
                    Text("The benefits that we provide to the community continue to expand into much-needed areas. Today, as Her Health First, we offer the Black Mothers United program through a trauma-informed lens which includes education, Pregnancy Coach support, Doula services, Lactation support, and referrals to mental health and other resources.")
                          .multilineTextAlignment(.center)
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                          .lineLimit(nil)
                          .padding(.trailing)
                          .padding(.leading)
                    
                Text("Visit Our Websites!")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    .padding()
                    Button(action: {UIApplication.shared.open(URL(string: "http://herhealthfirst.org/")!)}, label: {
                            OtherResourcesView(resourceTitle: "Her Health First", color: #colorLiteral(red: 0.9284504056, green: 0.5457601547, blue: 0.7060402036, alpha: 1)).padding(.bottom)
                    })
                   
                    Button(action: {UIApplication.shared.open(URL(string: "http://blackmothersunited.org/")!)}, label: {
                        OtherResourcesView(resourceTitle: "Black Mothers United", color: #colorLiteral(red: 0.9592515826, green: 0.545753479, blue: 0.4359562993, alpha: 1))
                    })

                   Spacer(minLength: 325)
                }.offset(y: UIScreen.main.bounds.height / 4)
            }.overlay(
                VStack {
                    TitleView()
                    Spacer()
                    TabBarView(bottomPadding: 0, colorAboutUs: #colorLiteral(red: 0.9592515826, green: 0.5457533002, blue: 0.4279192984, alpha: 1))
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

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
