//
//  AudioManager.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
    
    var player: AVAudioPlayer?
    
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    
    @Published private(set) var isLooping: Bool = false
    
    func startPlayer(track: String, isPreview: Bool = false) {
        
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Mp3 was not found: \(track)")
            return
        }
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default) //Will play even on silent mode
            try AVAudioSession.sharedInstance().setActive(true) //Will play even on silent mode
            
            player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
                isPlaying = true
            }
            
            
        } catch {
            
            print("App failed to initialize the audio player", error)
            
        }
    }
    
    func playPause() {
        guard let player = player else {
            print("No instance of audio player.")
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else{
            player.play()
            isPlaying = true
        }
    }
    
    func stop() {
        guard let player = player else {
            return
        }
        
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }
    
    func toggleLoop() {
        guard let player = player else {
            return
        }
        
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
    }
    
}

