//
//  NSOutlineView+Selection.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

extension NSOutlineView {
  
  public func forceTextFieldResponding(
    forRow row: Int,
    atColumn column: Int = .zero) {
      
      DispatchQueue.main.async { [weak self] in
        
        guard let `self` = self,
              let cellView = self.view(
                atColumn: column,
                row: row,
                makeIfNecessary: false) as? NSTableCellView,
              let textField = cellView.textField,
              textField.acceptsFirstResponder else { return }
        
        self.window?.makeFirstResponder(textField)
      }
    }
  
  public func makeFirstResponder(forRow row: Int, atColumn column: Int) {
    
    DispatchQueue.main.async { [weak self] in
      
      guard let `self` = self,
            let cellView = self.view(
              atColumn: column,
              row: row,
              makeIfNecessary: false) as? NSTableCellView,
            cellView.acceptsFirstResponder else { return }
      
      self.becomeFirstResponder()
      self.window?.makeFirstResponder(cellView)
    }
  }
}
