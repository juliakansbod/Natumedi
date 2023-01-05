//
//  Menu.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import SwiftUI

struct Menu: View {
    
    @Binding var open: Bool
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            HStack(spacing: 0) {
                Text("Natu")
                    .foregroundColor(.white)
                Text("medi")
                    .foregroundColor(.white)
            }
            .font(.title)
            .fontWeight(.bold)
            .padding(30)
            .padding(.top, 20)
            
            
            Row(rowActive: true, icon: "house", text: "Home")
            Row(rowActive: false, icon: "questionmark.circle", text: "Meditation tips")
            Row(rowActive: false, icon: "gear", text: "Settings")
            
            Spacer()
            
            Text("Natumedi, 2022.")
                .foregroundColor(.white.opacity(0.7))
                .font(.callout)
                .padding(.leading, 30)
            
        }
        .padding(.vertical, 30)
        .background(LinearGradient(gradient: Gradient(colors: [Color("light-blue"), Color("darkblue")]), startPoint: .top, endPoint: .bottom))
        .padding(.trailing, 80)
        .offset(x: open ? 0 : -UIScreen.main.bounds.width)
        .animation(Animation.easeInOut(duration: 0.5), value: open)
        .edgesIgnoringSafeArea(.vertical)
        
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(open: .constant(true))
    }
}

struct Row: View {
    var rowActive: Bool
    var icon = "house"
    var text = "Dashboard"
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(rowActive ? Color("pink") : .white)
                .font(.system(size: 20, weight: rowActive ? .heavy : .regular))
                .frame(width: 48, height: 32)
            
            Text(text)
                .foregroundColor(rowActive ? Color("pink") : .white)
                .font(.system(size: 20, weight: rowActive ? .heavy : .regular))
            
            Spacer()
        }
        .padding(4)
        .padding(.trailing, 20)
        .cornerRadius(20)
        .offset(x: 20)
    }
}
