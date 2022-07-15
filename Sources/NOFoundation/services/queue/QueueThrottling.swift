//
//  QueueThrottling.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public final class QueueThrottling {
  
  public enum TimeIntervals {
    
    public static let sec: TimeInterval = 1.0
    public static let less: TimeInterval = 0.3
    public static let `default`: TimeInterval = 0.05
  }
  
  public init(timeInterval: TimeInterval = TimeIntervals.default) {
    
    self.timeInterval = timeInterval > 0
    ? timeInterval
    : 0
  }
  
  public func throttle(block: @escaping VoidCallback) {
    workItem.cancel()
    workItem = DispatchWorkItem { block() }
    
    queue.asyncAfter(deadline: .now() + timeInterval,
                     execute: workItem)
  }
  
  private var timeInterval: TimeInterval
  
  private let queue: DispatchQueue = .init(label: "task.trottling.queue",
                                           qos: .utility)
  
  private var workItem: DispatchWorkItem = .init(block: {})
}
