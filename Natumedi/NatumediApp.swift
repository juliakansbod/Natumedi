//
//  NatumediApp.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import SwiftUI

@main
struct NatumediApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
                .environmentObject(AudioManager())
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
