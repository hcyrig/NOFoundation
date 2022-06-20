//
//  Range+NSRange.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

extension RangeExpression where Bound == String.Index  {
  
  public func nsRange<S: StringProtocol>(in string: S) -> NSRange
  { .init(self, in: string) }
}
