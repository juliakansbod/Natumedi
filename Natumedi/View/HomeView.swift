//
//  HomeView.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import SwiftUI

struct HomeView: View {
    
    @State var open = false
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                VStack(alignment: .leading){
                    
                    HStack{
                        HStack(spacing: 0) {
                            Text("Natu")
                                .foregroundColor(Color("light-blue"))
                            Text("medi")
                        }
                        .font(.title)
                        .fontWeight(.bold)
                        Spacer()
                        
                        Toggle(isOn: $isDarkMode){
                            Text("")
                        }
                        .tint(Color("light-blue"))
                        .offset(x: -10)
                        
                        Button {
                            self.open.toggle()
                        } label: {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                        }
                    }
                    .padding(30)
                    
                    ScrollView(showsIndicators: false){
                        
                        VStack(alignment: .leading, spacing: 10){
                            VStack {
                                Text("Time to")
                                    .font(.system(size: 45))
                                    .fontWeight(.heavy)
                                    .fixedSize(horizontal: false, vertical: true)
                                Text("rewind.")
                                    .font(.system(size: 45))
                                    .fontWeight(.heavy)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .foregroundColor(Color("light-blue"))
                            }
                            
                            
                            Text("We are so happy to see you here. Find your next session below and get started.")
                                .frame(maxWidth: 150)
                            
                            
                        }
                        .background{
                            Image("cartoon-1")
                                .resizable()
                                .scaledToFit()
                                .offset(x: 175, y: 25)
                                .frame(width: 360, height: 360)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 30)
                        
                        //MARK: Horisontella views med cards börjar här...
                        
                        VStack(alignment: .leading, spacing: 24){
                            
                            Text("Popular")
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 16){
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-2", title: "Thunderstorm", song: "thunderstorm").navigationBarBackButtonHidden(true)) {
                                        BigCard(image: "bg-2", title: "Thunderstorm")
                                    }
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-3", title: "Waves", song: "waves").navigationBarBackButtonHidden(true)) {
                                        BigCard(image: "bg-3", title: "Waves")
                                    }
                                    
                                }
                            }
                            
                            Text("All meditation sessions")
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 16){
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-1", title: "Birds", song: "birds").navigationBarBackButtonHidden(true)) {
                                        SmallCard(image: "bg-1", title: "Birds")
                                    }
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-4", title: "Storm", song: "distant-storm").navigationBarBackButtonHidden(true)) {
                                        SmallCard(image: "bg-4", title: "Storm")
                                    }
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-3", title: "Rain", song: "rain").navigationBarBackButtonHidden(true)) {
                                        SmallCard(image: "bg-3", title: "Rain")
                                    }
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-2", title: "Underwater", song: "underwater").navigationBarBackButtonHidden(true)) {
                                        SmallCard(image: "bg-2", title: "Underwater")
                                    }
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-1", title: "Waterfall", song: "waterfall").navigationBarBackButtonHidden(true)) {
                                        SmallCard(image: "bg-1", title: "Waterfall")
                                    }
                                    
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-2", title: "Thunderstorm", song: "thunderstorm").navigationBarBackButtonHidden(true)) {
                                        SmallCard(image: "bg-2", title: "Thunderstorm")
                                    }
                                    
                                    NavigationLink(destination: MeditationView(image: "bg-3", title: "Waves", song: "waves").navigationBarBackButtonHidden(true)) {
                                        SmallCard(image: "bg-3", title: "Waves")
                                    }
                                    
                                }
                            }
                            
                        }
                        .padding(.top, 40)
                        .padding(.leading, 30)
                        .font(.title2)
                        .fontWeight(.semibold)
                        
                    }
                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .foregroundColor(Color("dark-blue"))
                
                Menu(open: $open)
            }
            .background(Color("background"))
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AudioManager())
    }
}


