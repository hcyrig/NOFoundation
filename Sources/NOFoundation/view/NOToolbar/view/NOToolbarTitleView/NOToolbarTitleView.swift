//
//  NOToolbarTitleView.swift
//  NOToolbar
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public class NOToolbarTitleView: NSView {
  
  public enum ColorConstants {
    
    static let titleColor = NSColor.labelColor
    static let subTitleColor = NSColor.tertiaryLabelColor
  }
  
  public enum SizeConstants {
    
    static var widthSize: CGFloat { 140 }
    static var heightSize: CGFloat { 30 }
  }
  
  public enum FontConstants {
    
    static let titleFont = NSFont.systemFont(ofSize: 14.0, weight: .semibold)
    static let subTitleFont = NSFont.systemFont(ofSize: 11.0)
  }
  
  public override var isFlipped: Bool { true }
  
  public var itemIdentifier: String = .empty
  
  public var title: String = .empty {
    didSet {
      titleLabel?.stringValue = title
    }
  }
  
  public var subTitle: String = .empty {
    didSet {
      subTitleLabel?.stringValue = subTitle
    }
  }
  
  private var titleLabel: NSTextField!
  private var subTitleLabel: NSTextField!
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    
    prepareLayers()
  }
  
  override init(frame frameRect: NSRect) {
    super.init(frame: frameRect)
    
    prepareLayers()
  }
  
  func prepareLayers() {
    
    wantsLayer = true
    
    addSizeConstraints()
    
    titleLabel = makeTitleField()
    subTitleLabel = makeSubTitleField()
  }
  
  private func addSizeConstraints() {
    
    constraints.forEach({ self.removeConstraint($0) })
    
    let heightC: NSLayoutConstraint = .init(
      item: self,
      attribute: .height,
      relatedBy: .equal,
      toItem: nil,
      attribute: .height,
      multiplier: 1.0,
      constant: SizeConstants.heightSize)
    
    let widhtC: NSLayoutConstraint = .init(
      item: self,
      attribute: .width,
      relatedBy: .equal,
      toItem: nil,
      attribute: .width,
      multiplier: 1.0,
      constant: SizeConstants.widthSize)
    
    addConstraint(heightC)
    addConstraint(widhtC)
  }
  
  private func makeTitleField() -> NSTextField {
    
    let titleField = NSTextField(labelWithString: .empty)
    titleField.font = FontConstants.titleFont
    titleField.alignment = .left
    titleField.wantsLayer = true
    titleField.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    titleField.translatesAutoresizingMaskIntoConstraints = false
    titleField.textColor = ColorConstants.titleColor
    titleField.lineBreakMode = .byTruncatingTail
    
    anchorSubView(titleField,
                  positions: [.left, .top, .right],
                  insets: .init(top: .zero,
                                left: .zero,
                                bottom: .zero,
                                right: .zero))
    return titleField
  }
  
  private func makeSubTitleField() -> NSTextField {
    
    let titleField = NSTextField(labelWithString: .empty)
    titleField.font = FontConstants.subTitleFont
    titleField.alignment = .left
    titleField.wantsLayer = true
    titleField.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    titleField.translatesAutoresizingMaskIntoConstraints = false
    titleField.textColor = ColorConstants.subTitleColor
    titleField.lineBreakMode = .byTruncatingTail
    
    anchorSubView(titleField,
                  positions: [.left, .bottom, .right],
                  insets: .init(top: .zero,
                                left: .zero,
                                bottom: .zero,
                                right: .zero))
    return titleField
  }
}
