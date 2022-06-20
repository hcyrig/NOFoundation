//
//  NOFileURLContainer.swift
//  NOService
//
//  Created by hcyrig on 13.06.2022.
//

import Foundation

public class NOFileURLContainer {
  
  public init?(
    label: String) {
      
      fileURLLabelKey = label
      
      fileURLSafeAccessQueue = .init(
        label: label + ".queue",
        qos: .userInitiated)
    }
  
  public var url: URL? {
    
    get {
      
      var url: URL? = nil
      fileURLSafeAccessQueue.sync {
        url = _url
      }
      return url
    }
    
    set {
      
      fileURLSafeAccessQueue.async(flags: .barrier) {
        self._url = newValue
      }
    }
  }
  
  private var _url: URL? {
    
    set {
      
      do {
        
        let data = try newValue?.bookmarkData()
        
        let standerUserDefaults = UserDefaults.standard
        standerUserDefaults.set(data,
                                forKey: fileURLLabelKey)
        
      } catch {
        DEBUGLogger.log(error)
      }
    }
    
    get {
      
      let standerUserDefaults = UserDefaults.standard
      guard let data = standerUserDefaults.data(forKey: fileURLLabelKey)
      else { return nil }
      
      var resourceURL: URL? = nil
      
      var isStale = false
      
      if let url = try? URL(resolvingBookmarkData: data,
                               options: [.withSecurityScope],
                               relativeTo: nil,
                               bookmarkDataIsStale:  &isStale)
          
      {
        resourceURL = url
        
      } else if let url = try? URL(resolvingBookmarkData: data, bookmarkDataIsStale: &isStale) {
        
        resourceURL = url
        
      } else {
        
        DEBUGLogger.log("error")
      }
      
      if let url = resourceURL,
         !isStale,
         !url.startAccessingSecurityScopedResource() {
        
        DEBUGLogger.log("Couldn't access: \(url.path)")
      }
      
      return resourceURL
    }
  }
  
  private let fileURLLabelKey: String
  private let fileURLSafeAccessQueue: DispatchQueue
}
