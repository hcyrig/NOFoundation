//
//  NSWorkspace+DesktopImage.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

// Options:
// NSWorkspace.DesktopImageOptionKey.allowClipping
// NSWorkspace.DesktopImageOptionKey.fillColor
// NSWorkspace.DesktopImageOptionKey.imageScaling

extension NSWorkspace {
  
  public func bindNotifications() {
    
    NSWorkspace.shared.notificationCenter.addObserver(
      forName: NSWorkspace.activeSpaceDidChangeNotification,
      object: nil,
      queue: .main) { notification in
        
        guard let workspace = notification.object as? NSWorkspace else  { return }
        
        DEBUGLogger.log(workspace)
      }
  }
  
  enum SetDesktopImageError: Error {
    
    case notFileUrl(url: URL)
    case fileNotExists(url: URL)
    case incorrectURL(urlPath: String)
    case incorrectScreenPosition(url: URL?,
                                 screenPosition: Int)
  }
  
  public enum DesktopScreen {
    
    case position(Int)
    case all
  }
  
  public static func setDesktopImage(
    urlPath: String,
    window: NSWindow,
    screen: DesktopScreen = .all,
    imageOptions: [NSWorkspace.DesktopImageOptionKey: AnyObject] = [:]) throws {
      
      guard let url = URL(string: urlPath) else {
        
        throw SetDesktopImageError
          .incorrectURL(urlPath: urlPath)
      }
      
      if url.isFileURL {
        
        try setDesktopImage(url: url,
                            window: window,
                            screen: screen,
                            imageOptions: imageOptions)
        
        return
      }
    }
  
  public static func setDesktopImage(
    url: URL,
    window: NSWindow?,
    screen: DesktopScreen = .all,
    imageOptions: [NSWorkspace.DesktopImageOptionKey: AnyObject] = [:]) throws {
      
      guard (try? url.isFileExists) == true else {
        
        throw SetDesktopImageError
          .fileNotExists(url: url)
        
      }
      
      switch screen {
      case .all:
        
        try NSScreen.screens.enumerated().forEach({ index, screen in
          
          try removeDesktopImage(screen: screen,
                                 imageOptions: imageOptions)
          
          DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(index) + 1) {
            
            do {
             
              try rawSetDesktopImage(url: url,
                                     screen: screen,
                                     options: imageOptions)
              
            } catch {
              
              DEBUGLogger.log(error)
            }
            
          }
          
        })
        
      case .position(let postion):
        
        guard let screen = NSScreen.screens.safeElement(by: postion) else {
          
          throw SetDesktopImageError
            .incorrectScreenPosition(url: url,
                                     screenPosition: postion)
        }
        
        try removeDesktopImage(screen: .all,
                               imageOptions: imageOptions)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          
          try? rawSetDesktopImage(url: url,
                                  screen: screen,
                                  options: imageOptions)
          
        }
      }
    }
  
  public static func removeDesktopImage(
    screen: DesktopScreen = .all,
    imageOptions: [NSWorkspace.DesktopImageOptionKey: AnyObject] = [:]) throws {
      
      switch screen {
        
      case .all:
        try NSScreen.screens.forEach({
          
          try removeDesktopImage(screen: $0,
                                 imageOptions: imageOptions)
          
        })
        
      case .position(let postion):
        
        guard let screen = NSScreen.screens.safeElement(by: postion) else {
          
          throw SetDesktopImageError
            .incorrectScreenPosition(url: nil,
                                     screenPosition: postion)
        }
        
        try removeDesktopImage(screen: screen,
                               imageOptions: imageOptions)
        
      }
    }
  
  public static func removeDesktopImage(
    screen: NSScreen,
    imageOptions: [NSWorkspace.DesktopImageOptionKey: AnyObject] = [:]) throws {
      
      try rawSetDesktopImage(url: URL(fileURLWithPath: .empty),
                             screen: screen,
                             options: imageOptions)
    }
  
  public static func rawSetDesktopImage(
    url: URL,
    screen: NSScreen,
    options: [NSWorkspace.DesktopImageOptionKey: AnyObject] = [:]) throws {
      
      try NSWorkspace
        .shared
        .setDesktopImageURL(url,
                            for: screen,
                            options: options)
      
    }
}
