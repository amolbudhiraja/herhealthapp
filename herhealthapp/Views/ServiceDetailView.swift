//
//  ServiceDetailView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/21/21.
//

import SwiftUI

struct ServiceDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var navBarHidden: Bool = true
    var title: String
    var image: String
    var description: String
    var body: some View {
        VStack(spacing: 0){
            

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ServiceBlock(title: title, image: image, description: description)

                }
                .padding(.trailing)
                .padding(.leading)

                .offset(y: UIScreen.main.bounds.height / 4)
                Spacer(minLength: 325)
            }
            
            .overlay(
                VStack {
                    TitleView()
                    Spacer()
                    TabBarView(bottomPadding: 0, colorServices: #colorLiteral(red: 0.9592515826, green: 0.5457533002, blue: 0.4279192984, alpha: 1))
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

struct ServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetailView(title: "", image: "", description: "")
    }
}


struct ServiceBlock: View {
    @Environment(\.colorScheme) var colorScheme

    var title: String
    var image: String
    var description: String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            Text(title)
            .font(.title)
            .bold()
            .multilineTextAlignment(.center)
            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
        Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.3), radius: 10)
                .padding()
          Text(description)
            .multilineTextAlignment(.center)
            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
            .lineLimit(nil)
        }
        
    }
}
