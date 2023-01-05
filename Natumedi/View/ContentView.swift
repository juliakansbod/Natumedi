//
//  ContentView.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HomeView()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AudioManager())
    }
}
