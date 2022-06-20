//
//  NSView+Binding.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public enum BindedSize {
  
  case top(NSLayoutConstraint)
  case right(NSLayoutConstraint)
  case left(NSLayoutConstraint)
  case bottom(NSLayoutConstraint)
}

public extension NSView {
  
  @discardableResult
  func bindSubview(_ subview: NSView,
                   offset: NSEdgeInsets = .init()) -> [BindedSize] {
    
    subview.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(subview)
    
    let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: subview, attribute: .top, multiplier: 1.0, constant: -offset.top)
    let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: subview, attribute: .bottom, multiplier: 1.0, constant: offset.bottom)
    let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: subview, attribute: .leading, multiplier: 1.0, constant: -offset.left)
    let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: subview, attribute: .trailing, multiplier: 1.0, constant: offset.right)
    
    let subviewLayoutConstraints = [top, bottom, leading, trailing]
    NSLayoutConstraint.activate(subviewLayoutConstraints)
    return [BindedSize.top(top), BindedSize.bottom(bottom), BindedSize.left(leading), BindedSize.right(trailing)]
  }
  
  enum AnchorPosition: CaseIterable {
    
    case top
    case bottom
    case left
    case right
  }
  
  @discardableResult
  func anchorSubView(
    _ subView: NSView,
    positions: [AnchorPosition] = AnchorPosition.allCases,
    insets: NSEdgeInsets = .init()) -> [NSLayoutConstraint] {
    
    subView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(subView)
    
    return positions.compactMap {
      
      switch $0 {
      case .top:
        
        return NSLayoutConstraint(
          item: subView,
          attribute: .top,
          relatedBy: .equal,
          toItem: self,
          attribute: .top,
          multiplier: 1.0,
          constant: insets.top)
        
      case .right:
        
        return NSLayoutConstraint(
          item: subView,
          attribute: .trailing,
          relatedBy: .equal,
          toItem: self,
          attribute: .trailing,
          multiplier: 1.0,
          constant: insets.right)
        
      case .bottom:
        
        return NSLayoutConstraint(
          item: subView,
          attribute: .bottom,
          relatedBy: .equal,
          toItem: self,
          attribute: .bottom,
          multiplier: 1.0,
          constant: insets.bottom)
        
      case .left:
        
        return NSLayoutConstraint(
          item: subView,
          attribute: .leading,
          relatedBy: .equal,
          toItem: self,
          attribute: .leading,
          multiplier: 1.0,
          constant: insets.left)
      }
    }.compactMap({ (constraint: NSLayoutConstraint) in
      constraint.isActive = true
      return constraint
    })
  }
  
  func anchorSize(size: CGSize) {
    
    translatesAutoresizingMaskIntoConstraints = false
    
    widthAnchor.constraint(equalToConstant: size.width).isActive = true
    heightAnchor.constraint(equalToConstant: size.height).isActive = true
  }
  
  enum AnchorSide: CaseIterable {
    
    case width
    case height
  }
  
  func anchorSize(size: CGSize,
                  side: [AnchorSide] = AnchorSide.allCases) {
    
    translatesAutoresizingMaskIntoConstraints = false
    
    side.forEach {
      
      switch $0 {
      case .height:
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
      case .width:
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
      }
    }
  }
  
  enum AnchorCenterPosition: CaseIterable {
    
    case X
    case Y
  }
  
  func anchorCenter(
    subView view: NSView,
    positions: [AnchorCenterPosition] = AnchorCenterPosition.allCases) {
    
    view.translatesAutoresizingMaskIntoConstraints = false
    
    positions.forEach {
      
      switch $0 {
      case .X: view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
      case .Y: view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
      }
    }
  }
  
  func aspectRation(_ ratio: CGFloat) {
    
    NSLayoutConstraint(
      item: self,
      attribute: .height,
      relatedBy: .equal,
      toItem: self,
      attribute: .width,
      multiplier: ratio,
      constant: .zero).isActive = true
  }
  
  func disableLayoutPriorities() {
    
    setContentHuggingPriority(.init(1.0), for: .horizontal)
    setContentHuggingPriority(.init(1.0), for: .vertical)
    
    setContentCompressionResistancePriority(.init(1.0), for: .horizontal)
    setContentCompressionResistancePriority(.init(1.0), for: .vertical)
  }
}
