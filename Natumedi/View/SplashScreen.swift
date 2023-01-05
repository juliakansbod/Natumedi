//
//  SplashScreen.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            
            VStack{
                
                ZStack {
                    
                    Image("boarding-3")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        Image("cartoon-1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 360, height: 360)
                        
                        HStack(spacing: 0) {
                            Text("Natu")
                                .foregroundColor(Color("light-blue"))
                            Text("medi")
                        }
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .offset(y: -60)
                        .foregroundColor(Color("darkblue"))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    
                }
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
            .environmentObject(AudioManager())
    }
}
