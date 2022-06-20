//
//  URL+NSFileManager.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension URL {
  
  enum URLError: Error {
    
    case notFileUrl(url: URL)
  }
  
  var isFileExists: Bool {
    
    get throws {
      
      guard isFileURL else {
        throw URLError.notFileUrl(url: self)
      }
      
      return FileManager.isFileExists(path: path)
    }
  }
}
