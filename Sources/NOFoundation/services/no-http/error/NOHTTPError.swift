//
//  NOHTTPError.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public enum NOHTTPError: Error {
  
  case badURLReqeust
  case failure(error: Error)
  case noData
  case noHTTPURLResponse(error: Error?)
}
