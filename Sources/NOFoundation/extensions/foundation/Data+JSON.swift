//
//  Data+JSON.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension Data {
  
  func decodeJSON<T: Decodable>() -> T? {
    
    let jsonDecoder = JSONDecoder()
    var decoded: T? = nil
    do {
      decoded = try jsonDecoder.decode(T.self, from: self)
    } catch {
      DEBUGLogger.log(error)
    }
    return decoded
  }
  
  static func encodeJSON<T: Codable>(value: T) -> Data? {
    
    let jsonEncoder = JSONEncoder()
    var data: Data?
    do {
      data = try jsonEncoder.encode(value)
    } catch {
      DEBUGLogger.log(error)
    }
    return data
  }
}
