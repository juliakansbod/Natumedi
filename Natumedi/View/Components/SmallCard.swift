//
//  SmallCard.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import SwiftUI

struct SmallCard: View {
    var image: String = ""
    var title: String = ""
    
    var body: some View {
        
        ZStack{
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)

            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 40)
            
        }
        .foregroundColor(.white)
        .padding(.all)
        .frame(width: 150, height: 150)
        .cornerRadius(30)
        
    }
    
}

struct SmallCard_Previews: PreviewProvider {
    static var previews: some View {
        SmallCard(image: "bg-1", title: "Rain")
    }
}
