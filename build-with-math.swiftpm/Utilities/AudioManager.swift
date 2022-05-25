//
//  AudioManager.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("File doesn't exist or can't play the audio.")
        }
    }
}
