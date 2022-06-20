//
//  String+TokensRepresentation.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import AppKit

public extension String {
  
  func tokenizedAttributedString(color: NSColor) -> NSAttributedString {
    
    tokenizedAttributedString(tokens: nsTokens,
                              color: color)
  }
  
  func tokenizedAttributedString(tokens: TokensRepresentation,
                                 color: NSColor) -> NSAttributedString {
    
      .tokenizedAttributedString(sourceString: self,
                                 tokens: tokens,
                                 color: color)
  }
  
  var tags: [String] {
    split(separator: " ")
      .compactMap(String.init)
      .compactMap({$0.lowercased()})
  }
  
  func tags(separator: Self.Element) -> [String] {
    replacingOccurrences(of: "\n", with: " ")
      .split(separator: separator)
      .compactMap(String.init)
      .compactMap({$0.lowercased()})
      .compactMap({$0.trimmingCharacters(in: .whitespacesAndNewlines)})
  }
  
  var tokens: [(String, Range<Index>)] {
    
    tags
      .filter(isText)
      .compactMap {
        
        guard let range = self.lowercased().range(of: $0) else { return nil }
        return ($0, range)
      }
  }
  
  var nsTokens: [(String, NSRange)] {
    
    tokens
      .compactMap { ($0.0 ,$0.1.nsRange(in: self.lowercased())) }
  }
  
  func isText(_ string: String) -> Bool {
    
    let string = string as NSString
    let regex = try! NSRegularExpression(pattern: "[0-9a-zA-Z]{1,}")
    return !regex.matches(in: string as String,
                         options: .reportProgress,
                         range: NSRange(location: 0,
                                        length: string.length))
      .isEmpty
  }
  
  func isRealWord(_ string: String) -> Bool {

    let checker = NSSpellChecker.shared
    let result = checker.checkSpelling(of: string,
                                       startingAt: 0,
                                       language: "en",
                                       wrap: false,
                                       inSpellDocumentWithTag: 0,
                                       wordCount: nil)
    return result.location == NSNotFound
  }
}

