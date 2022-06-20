//
//  URL+Icon.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public enum IconType {
  
  static var orginalIconTitle: String {
    "original"
  }
  
  case folder
  case disk
  case unknown
  
  var defaultTitle: String {
    switch self {
    case .folder: return "Icon\r"
    case .disk: return ".VolumeIcon.icns"
    case .unknown: return .empty
    }
  }
}

extension URL {
  
  public var isIconExists: Bool { iconType != .unknown }
  
  public var isOrginalIconExists: Bool {
    
    isIconExists
      && FileManager
      .isFileExists(path: iconFileURL(type: iconType,
                                      with: IconType.orginalIconTitle).path)
  }
  
  public var originalIconURL: URL {
    iconFileURL(type: iconType, with: IconType.orginalIconTitle)
  }
  
  public var iconFileURL: URL {
    iconFileURL(type: iconType)
  }
  
  var iconType: IconType {
    isDiskIconExists
      ? .disk
      : isFolderIconExists ? .folder : .unknown
  }
  
  func iconFileURL(type: IconType, with string: String = .empty) -> URL {
    appendingIcon(with: type).extendingIcon(with: string)
  }
  
  func appendingIcon(with type: IconType) -> URL {
    appendingPathComponent(type.defaultTitle)
  }
  
  func extendingIcon(with string: String = "") -> URL {
    appendingPathExtension(string)
  }
}

// MARK: - Folder Icon -

extension URL {
  
  var isFolderIconExists: Bool {
    
    FileManager
      .isFileExists(path: iconFileURL(type: .folder).path)
  }
}

// MARK: - Disk Icon -

extension URL {
  
  var isDiskIconExists: Bool {
    
    FileManager
      .isFileExists(path: iconFileURL(type: .disk).path)
  }
}
