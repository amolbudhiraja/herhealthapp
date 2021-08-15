//
//  ServiceHomeView.swift
//  herhealthapp
//
//  Created by Amol Budhiraja on 7/20/21.
//

import SwiftUI

struct ServiceHomeView: View {
    @State var navBarHidden: Bool = true
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
            VStack(spacing: 0){
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 5) {
                    Text("Our Services!")
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))
                    Text("Here at Her Health First, we offer a variety of services and opportunities to help support our clients!")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack () {
                                NavigationLink(destination: ServiceDetailView(title: "Doula Care", image: "DoulaCare", description: DoulaCare)) {

                                ServicesScrollView(image: "DoulaCare", heading: "Doula\nCare\n", description: "A doula is a trained professional who supports moms and mom-to-be before, during, and after childbirth.")
                                }
                                NavigationLink(destination: ServiceDetailView(title: "Lactation Support", image: "LactationSupport", description: LactationSupport)) {

                                ServicesScrollView(image: "LactationSupport", heading: "Lactation Support\n", description: "The breastfeeding process can be challenging, but it doesn’t have to be. We connect you with lactation consultants.")
                                }
                                NavigationLink(destination: ServiceDetailView(title: "Health and Wellness", image: "HealthAndWellness", description: HealthAndWellness)) {

                                ServicesScrollView(image: "HealthAndWellness", heading: "Health and Wellness", description: "Our program offers a holistic approach to health which includes meditation, prenatal yoga, and nutrition education to encourage healthy living.")
                                }
                                NavigationLink(destination: ServiceDetailView(title: "Mommy Mingles", image: "MommyMingles", description: MommyMingles)) {

                                ServicesScrollView(image: "MommyMingles", heading: "Mommy\nMingles\n", description: "Sis we’re here for you! Join a community with a no-judgment zone where you feel valued. We discuss motherhood.")
                                }
                                
                                
                                
                                Button(action: { UIApplication.shared.open(URL(string: "http://blackmothersunited.org/maternity-portraits/")!)}, label: {
                                   
                                    ServicesScrollView(image: "MaternityPortraits", heading: "Maternity Portraits\n", description: "The Black Mothers United program is happy to provide you with an opportunity to capture professional maternity photos.")

                                })
                                
                            }
                        }.padding(.bottom)

                     
                       Spacer(minLength: 325)
                    }.offset(y: UIScreen.main.bounds.height / 4)
                }.overlay(
                    VStack {
                        TitleView()
                        Spacer()
                        TabBarView(bottomPadding: 0, colorServices: #colorLiteral(red: 0.9592515826, green: 0.5457533002, blue: 0.4279192984, alpha: 1))
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

struct ServiceHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceHomeView()
    }
}

struct ServicesScrollView: View {
    @Environment(\.colorScheme) var colorScheme

    var image: String
    var heading: String
    var description: String
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
                    Image(image)
                        .resizable()
                        .cornerRadius(25)
                        .aspectRatio(contentMode: .fit)
                    
                    Spacer()
                    HStack {
                        Text(heading) //Articles
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.center)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.1397067904, green: 0.3545505404, blue: 0.4932047129, alpha: 1)))

                    }
                    
                
                    HStack {
                        Text(description)
                            .lineLimit(nil)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            .padding(.trailing)
                            .padding(.leading) 
                            .padding(.bottom, 10)
                    }
                }
            }
        }.padding(10).frame(width: 250)
    }
}


//Services Descriptions

let DoulaCare = "A doula is a trained professional who supports moms and mom-to-be before, during, and after childbirth.\nOur doulas begin working with clients at the start of the third trimester and provide ongoing communication between 32 weeks and delivery to address your birth plan and make necessary changes as time progresses.  They provide you with emotional and physical support to ensure you have a healthy, safe, and positive birthing experience. Your doula will educate you about what to expect during the labor and delivery process to ease any fear or concerns you have so you feel comforted and empowered on this journey. During labor, they help you manage pain and relaxation when it is most needed. As stated in “Continuous Support for Women During Childbirth,” having a doula present reduces the rate of C-sections (Hodnett ED, Gates S, et al., 2013) as c-sections are higher among African American women.\nAn essential practice in our doula care is to provide trauma-informed services. Meaning our doulas will reduce the risk of trauma/re-traumatization during pregnancy, labor, and delivery. We conduct client screenings to assess trauma exposure and health complications before your labor process begins. It is vital to ensure your mental health needs are met. According to the “Center for American Progress, “studies show that doulas provide critical advocacy and support, especially for those at risk of bias and discrimination (www.americanprogress.org). We understand the sensitivity and significance of each stage of pregnancy, especially for African American women. Our doulas take on the challenging parts so you can embrace the joys of motherhood."

let LactationSupport = "The breastfeeding process can be challenging, but it doesn’t have to be. According to the CDC, African American women breastfeed less and therefore miss the process’s benefits. These benefits include decreased chances of childhood and adolescent obesity, less risk of sudden infant death syndrome (SIDS), and helps prevent ear infections, healthy nutrients for premature babies, and diabetes. We connect you with lactation consultants who provide you with one-on-one support and alternatives to guide you through the process.\nWe help create a personalized breastfeeding plan to help you meet your breastfeeding goals. Breastfeeding has also proven to reduce the risk of postpartum depression. It is said to improve both mother and baby sleeping patterns, leading to more emotional involvement with the child that enhances bonding. It creates less of a financial strain because you don’t have to purchase formula, which can be very expensive. We want you to feel empowered during this process, and therefore, we encourage this practice and aim to assist you in any way we can."

let HealthAndWellness = "African American women deal with many adversities, often causing them to overlook their health and wellness. They also usually experience a lack of proper care and attention at a disproportionate rate. In these life-changing moments, such as during pregnancy, the benefits of taking care of your mental and physical health and knowing how to are crucial to building a happy and healthy lifestyle. We teach you how to monitor postpartum depression and any signs you may need mental and physical health services. A study conducted by the University Wisconsin-Madison and the University of California, San Francisco (UCSF) shows that mindfulness training that addresses fear and pain during the labor process can improve the birthing experience and reduce pregnant women’s depression symptoms pregnancy and the early stages of postpartum (www.news.wisc.edu).\nOur program offers a holistic approach to health, including mindfulness (a state of active, open attention to the present), meditation, prenatal yoga, and nutrition education to encourage healthy living and align your mind, body, and spirit. Managing stress is critical in maintaining a healthy pregnancy. Mothers often put everyone before their own needs. Here at Black Mothers United, you can prioritize yourself and focus on your wellness to become the best version of yourself."

let MommyMingles = "Sis, we’re here for you! Join a community with a no-judgment zone where you feel valued. We discuss motherhood experiences, share information, uplift, and empower each other. The group also addresses topics related to pregnancy health, decreasing stress throughout your pregnancy, financial literacy, mommy and baby care post-delivery, domestic violence awareness, and stress-relief practices. The necessary conversations that take place at our mommy mingles allow mothers the space to be themselves in a positive, supportive environment. The African American experience is unique, and our mommy mingles provide assurance and comfortability to discuss topics relevant to your life. Our voices are viewed differently among other groups and here at our mommy mingles, you can freely express yourself in an inclusive environment.\nStudies show that sisterhood programs improve pre-term birth rates compared to traditional care, specifically among Black women. Group learning programs such as BMU reduce anxiety, improves the health of mothers and their babies, and contribute to long-lasting relationships."
