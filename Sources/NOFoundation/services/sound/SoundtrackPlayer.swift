//
//  SoundtrackPlayer.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation
import AVKit

public final class SoundtrackPlayer {
  
  public enum TrackType: String {
    case mp3
  }
  
  public init() {}
  
  public func playWithBundle(bundle: Bundle? = nil,
                             resourceName: String,
                             resourceType: TrackType) {
    
    var bundle = bundle
    if bundle == nil {
      bundle = Bundle(for: Self.self)
    }
    
    guard let url = bundle?
            .url(
              forResource: resourceName,
              withExtension: resourceType.rawValue) else { return }
    
    play(with: url)
  }
  
  public func play(with url: URL) {
    
    do {
      
      myPlayer = try AVAudioPlayer(contentsOf: url)
      
      myPlayer.numberOfLoops = .zero
      myPlayer.prepareToPlay()
      myPlayer.volume = 1.0
      myPlayer.play()
    }
    catch { DEBUGLogger.log(error) }
  }
  
  public func stop() { myPlayer.stop() }
  
  private var myPlayer = AVAudioPlayer()
}

extension SoundtrackPlayer {
  
  static func playDefault() {
    
    SoundtrackPlayer().playDefault()
  }
  
  public func playDefault() {
    
    playWithBundle(resourceName: "default",
                   resourceType: .mp3)
  }
}
