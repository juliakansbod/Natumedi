//
//  MeditationView.swift
//  Natumedi
//
//  Created by Julia Kansbod on 2022-12-08.
//

import SwiftUI

struct MeditationView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var image: String = ""
    var title: String = ""
    var song: String = ""
    
    var body: some View {
        
        ZStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .ignoresSafeArea()
            
            VStack(spacing: 32){
                
                HStack{
                    Button {
                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                if audioManager.isPlaying {
                    Text("Your session has begun.\nTake deep breaths and relax.")
                        .font(.title2)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                } else {
                    Text("Get comfortable and restart \nwhenever you are ready.")
                        .font(.title2)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                //MARK: Playback
                
                if let player = audioManager.player{
                    VStack(spacing: 5){
                        Slider(value: $value, in: 0...player.duration) { editing in
                            
                            isEditing = editing
                            
                            if !editing {
                                player.currentTime = value
                            }
                            
                        }
                        .accentColor(.white)
                        
                        HStack{
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            Spacer()
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "1:00")
                        }
                        .font(.caption)
                        .foregroundColor(.white)
                    }
                    
                    HStack{
                        let color: Color = audioManager.isLooping ? .teal : .white
                        PlaybackControlButton(systemName: "repeat", color: color) {
                            audioManager.toggleLoop()
                            
                        }
                        
                        Spacer()
                        
                        PlaybackControlButton(systemName: "gobackward.10") {
                            player.currentTime -= 10
                        }
                        
                        Spacer()
                        
                        PlaybackControlButton(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44) {
                            audioManager.playPause()
                        }
                        
                        Spacer()
                        
                        PlaybackControlButton(systemName: "goforward.10") {
                            player.currentTime += 10
                        }
                        
                        Spacer()
                        
                        PlaybackControlButton(systemName: "stop.fill") {
                            audioManager.stop()
                            dismiss()
                        }
                    }
                    
                }
                
            }
            .padding(20)
        }
        .onAppear{
            audioManager.startPlayer(track: song, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else {
                return
            }
            value = player.currentTime
        }
        
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView(image: "bg-1", title: "Birds", song: "birds")
            .environmentObject(AudioManager())
    }
}
