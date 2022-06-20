//
//  Arch-CLEAN.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation
import AppKit

public protocol Contexts { }

public protocol Assembler {
  
  associatedtype T: NSViewController
  associatedtype C: Contexts
  
  var context: C { get }
  
  func module() -> T
}

public protocol Interactor {}
open class BaseInteractor: Interactor {
  public init() {}
}

public protocol Presenter {}
open class BasePresenter: Presenter {
  public init() {}
}

public protocol View: AnyObject { }
open class BaseViewController: NSViewController {
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    setupInterface()
  }
  
  open func setupInterface() { }
}

// MARK: - View -
extension BaseViewController: View { }

public protocol ViewCicleInteractor: Interactor {
  
  func viewDidLoad()
}
