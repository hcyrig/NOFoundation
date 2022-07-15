//
//  FocusNotifiableTextField.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

open class FocusNotifiableTextField: NSTextField {
  
  open var isStartFocusDetecting: Bool = false
  
  open var onFocusCallback: VoidCallback?
  
  open override func becomeFirstResponder() -> Bool {
    
    let becomeStatus = super.becomeFirstResponder()
    
    isStartFocusDetecting = becomeStatus
    
    return becomeStatus
  }
  
  open override func resignFirstResponder() -> Bool {
    
    defer { isStartFocusDetecting = false }
    
    let relinquishStatus = super.resignFirstResponder()
    
    if relinquishStatus { onFocusCallback?() }
    
    return relinquishStatus
  }
}
