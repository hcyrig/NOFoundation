//
//  FocusNotifiableSearchField.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public protocol FocusNotifiableSearchFieldDelegate: AnyObject {
  
  func startSearchFieldFocus(_ searchField: FocusNotifiableSearchField)
  func endSearchFieldFocus(_ searchField: FocusNotifiableSearchField)
}

open class FocusNotifiableSearchField: NSSearchField {
  
  open weak var focusDelegate: FocusNotifiableSearchFieldDelegate?
  
  open var isStartFocusDetecting: Bool = false
  
  open override func becomeFirstResponder() -> Bool {
    
    let becomeStatus = super.becomeFirstResponder()
    
    isStartFocusDetecting = becomeStatus
    
    return becomeStatus
  }
  
  open override func resignFirstResponder() -> Bool {
    
    defer { isStartFocusDetecting = false }
    
    let relinquishStatus = super.resignFirstResponder()
    
    if relinquishStatus {
      self.focusDelegate?.startSearchFieldFocus(self)
    }
    
    return relinquishStatus
  }
}
