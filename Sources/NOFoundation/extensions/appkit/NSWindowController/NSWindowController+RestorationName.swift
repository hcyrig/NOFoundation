//
//  NSWindowController+RestorationName.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension NSWindowController {

  func applyWindowControllerRestorationName(_ name: String) {
    
    shouldCascadeWindows = false
    window?.setFrameAutosaveName("name")
  }
}

