//
//  URL+RepresentingDirectory.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

extension URL {
  
  public var isRepresentingDirectory: Bool {
    
    !isContainer
      && isRepresentingFolder
      && isWritableFolder
  }
  
  public var applicationExtension: String { "app" }
  
  public var isContainer: Bool {
    pathExtension == applicationExtension
  }
  
  public var isRepresentingFolder: Bool {
    FileManager.isRepresentedFolder(url: self)
  }
  
  public var isWritableFolder: Bool {
    FileManager.isWritableFolder(url: self)
  }
  
  public var isInUsersFolder: Bool {
    FileManager.isInUsersFolder(url: self)
  }
  
  public var isNotRootURL: Bool {
    absoluteString != "file:///"
  }
}

// check that an user chooses only one folder item
extension Array where Element == URL {
  
  public var isRepresentingDirectories: Bool {
    !representingDirectionaries.isEmpty
  }
  
  public var representingDirectionaries: [Element] {
    filter({ $0.isRepresentingDirectory } )
  }
  
  public var represetingSecondLevelUrls: [Element] {
    filter({ $0.isNotRootURL })
  }
}

// check that an user chooses only one folder item
extension Array where Element == NSURL {
  
  public var isRepresentingDirectories: Bool {
    (self as [URL]).isRepresentingDirectories
  }
  
  public var representingDirectionaries: [Element] {
    (self as [URL]).representingDirectionaries as [Element]
  }
}
