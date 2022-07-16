//
//  Double+Format.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public extension Double {
  
  func toFormatedPoints(
    afterDotPlaces places: Int,
    kvalueSymbol: String,
    mvalueSymbol: String) -> String {
    
    let thousandNum = self / 1000
    let millionNum = self / 1000000
    
    if self >= 1000 && self < 1000000 {
      
      if(floor(thousandNum) == thousandNum){
        return("\(Int(thousandNum))\(kvalueSymbol)")
      }
      
      if places == .zero {
        
        let value = Int(thousandNum.roundToPlaces(places))
        return("\(value)\(kvalueSymbol)")
      } else {
        
        let value = thousandNum.roundToPlaces(places)
        return("\(value)\(kvalueSymbol)")
      }
    }
    
    if self > 1000000{
      
      if(floor(millionNum) == millionNum){
        return("\(Int(thousandNum))\(kvalueSymbol)")
      }
      
      if places == .zero {
        
        let value = Int(millionNum.roundToPlaces(places))
        return ("\(value)\(mvalueSymbol)")
        
      } else {
        
        let value = millionNum.roundToPlaces(places)
        return ("\(value)\(mvalueSymbol)")
      }
    } else{
      
      if (floor(self) == self) {
        return ("\(Int(self))")
      }
      
      if places == .zero {
        
        return ("\(Int(self))")
        
      } else {
        
        return ("\(self)")
      }
    }
  }
  
  func roundToPlaces(_ places: Int) -> Double {
    
    let divisor = pow(10.0, Double(places))
    return Darwin.round(self * divisor) / divisor
  }
}
