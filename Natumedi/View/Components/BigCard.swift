//
//  BigCard.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import SwiftUI

struct BigCard: View {
    
    var image: String = ""
    var title: String = ""
    
    var body: some View {
        
        ZStack{
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 252, height: 300)
            
            Text("New!")
                .font(.custom("NothingYouCouldDo", size: 40))
                .frame(maxHeight: .infinity, alignment: .top)
                .offset(x: 50, y: 20)
                .foregroundColor(.white)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 40)
            
        }
        .foregroundColor(.white)
        .padding(.all)
        .frame(width: 252, height: 300)
        .cornerRadius(30)
        
    }
}

struct BigCard_Previews: PreviewProvider {
    static var previews: some View {
        BigCard(image: "bg-2", title: "Thunderstorm")
    }
}
