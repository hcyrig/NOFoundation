//
//  MemoryInfo.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public enum MemoryInfo {
  
  public static func memoryUsageInfo() -> String {
    
    toString(memoryAmount: calculatePhysMemory())
  }
  
  public static func calculatePhysMemory() -> UInt64 {
    
    var kernalTaskInfo = task_vm_info_data_t()
    
    let kernelTaskResult = physMemoryAmountTask(kernalTaskInfo: &kernalTaskInfo)

    return physMemoryAmount(kernalTaskInfo: kernalTaskInfo,
                            kernelTaskResult: kernelTaskResult)
  }
  
  public static func physMemoryAmountTask(kernalTaskInfo: inout task_vm_info) -> kern_return_t {
    
    var count = mach_msg_type_number_t(MemoryLayout<task_vm_info>.size) / 4
    
    return withUnsafeMutablePointer(to: &kernalTaskInfo) {
      $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
        task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
      }
    }
  }
  
  public static func physMemoryAmount(
    kernalTaskInfo: task_vm_info,
    kernelTaskResult: kern_return_t) -> UInt64 {
    
    if kernelTaskResult != KERN_SUCCESS { return .zero }
    return UInt64(kernalTaskInfo.phys_footprint)
  }
  
  public static func toString(memoryAmount: UInt64) -> String {
    
    let bytesInMegabyte = 1024.0 * 1024.0
    let usedMemory = Double(memoryAmount) / bytesInMegabyte
    return String(format: memoryInfoFormat, usedMemory)
  }

  public static var memoryInfoFormat: String {
    "%.1f MB"
  }
}
