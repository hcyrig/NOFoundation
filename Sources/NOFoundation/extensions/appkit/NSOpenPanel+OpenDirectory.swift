//
//  NSOpenPanel+OpenDirectory.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSOpenPanel {
  
  typealias ComplectionCallback = ( [URL] ) -> Void
  
  static func openDirectory(path: String,
                            allowedMultipleSelection: Bool = true,
                            complection: @escaping ComplectionCallback) {
    
    let folderSelectionDialog = NSOpenPanel()
    
    folderSelectionDialog.prompt = "Apply"
    folderSelectionDialog.message = "Please choose a folder"
    folderSelectionDialog.directoryURL = URL(fileURLWithPath: path)
    
    folderSelectionDialog.canChooseFiles = false
    folderSelectionDialog.allowedFileTypes = ["N/A"]
    folderSelectionDialog.allowsOtherFileTypes = false
    
    folderSelectionDialog.allowsMultipleSelection = allowedMultipleSelection
    
    folderSelectionDialog.canChooseDirectories = true
    folderSelectionDialog.canCreateDirectories = true
    
    let dialogButtonPressed = folderSelectionDialog.runModal()
    
    if dialogButtonPressed == NSApplication.ModalResponse.OK {
      
      let urls = folderSelectionDialog.urls.represetingSecondLevelUrls
      
      complection(urls)
      
    }
    else {
      
      complection([])
      DEBUGLogger.log("User cancelled folder selection panel")
    }
  }
}
