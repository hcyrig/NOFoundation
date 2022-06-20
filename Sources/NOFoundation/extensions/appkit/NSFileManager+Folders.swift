//
//  NSFileManager+Extension.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension FileManager {
  
  static func isRepresentedFolder(url: URL) -> Bool {
    
    var isDirectory: ObjCBool = ObjCBool(booleanLiteral: false)
    let manager = FileManager.default
    if manager.fileExists(atPath: url.path,
                          isDirectory: &isDirectory) {
      return isDirectory.boolValue
    }
    return false
  }
  
  static func isWritableFolder(url: URL) -> Bool {
    
    FileManager
      .default
      .isWritableFile(atPath: url.path)
  }
  
  static func isInUsersFolder(url: URL) -> Bool {
    
    var components = url.pathComponents
    _ = components.removeFirst()
    guard let folder = components.first,
          folder == "Users" else { return false }
    return true
  }
}

public extension FileManager {
  
  static func safeRemoveItem(url: URL) {
    do {
      try FileManager().trashItem(
        at: url,
        resultingItemURL: nil)
      
      DEBUGLogger.log("Removed item: \(url)")
    } catch {
      DEBUGLogger.log("Removed item's error \(error)")
    }
  }
  
  static func safeAddDirectory(url: URL) -> Bool {
    
    do {
      
      try FileManager().createDirectory(at: url,
                                        withIntermediateDirectories: true,
                                        attributes: nil)
      
      DEBUGLogger.log("Removed item: \(url)")
    } catch {
      DEBUGLogger.log("Removed item's error \(error)")
      return false
    }
    
    return true
  }
  
  static func safeTemporaryDirectory(path: String,
                                     resourceExtension: String) -> URL {
    
    FileManager
      .default
      .temporaryDirectory
      .appendingPathComponent(path)
      .appendingPathExtension(resourceExtension)
  }
}

public extension FileManager {
  
  static func isFileExists(path: String) -> Bool {
    
    var isDirectory: ObjCBool = false
    return FileManager().fileExists(atPath: path,
                                    isDirectory: &isDirectory)
    && !isDirectory.boolValue
  }
}

public extension FileManager {
  
  static var downdloadURL: URL? {
    
    do {
      
      return try FileManager.default.url(for: FileManager.SearchPathDirectory.downloadsDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: true)
      
    } catch{
      
      DEBUGLogger.log(error)
      return nil
    }
  }
  
  static var homeDowndloadURL: URL {
    
    .init(fileURLWithPath: NSHomeDirectory())
    .appendingPathComponent("Downloads")
  }
}
