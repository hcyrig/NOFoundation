//
//  NOHTTP.swift
//  NOFoundation
//
//  Copyright © 2022 Kostiantyn Girych a.k.a "hcyrig". All rights reserved.
//

import Foundation

public protocol NOHTTP {
  
  var httpHeaders: NOHTTPHeaders? { get }
  var cachePolicy: NSURLRequest.CachePolicy { get }
  
  func execute(_ request: NOHTTPRequest,
               with completionHandler: @escaping NOHTTPResponseClosure)
  
  func cancelTasks()
}

open class NOHTTPClient: NSObject {
  
  public static let shared = NOHTTPClient()
  
  private lazy var session: URLSession = {
    
    let operationQueue = OperationQueue()
    
    operationQueue.qualityOfService = .utility // preffered for networking services
    
    return .init(configuration: sessionConfiguration,
                 delegate: nil,
                 delegateQueue: operationQueue)
  }()
  
  private lazy var sessionConfiguration: URLSessionConfiguration = {
    
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 5.0
    configuration.waitsForConnectivity = true
    configuration.timeoutIntervalForResource = 60 * 10
    return configuration
  }()
  
  private let requestDispatchQueue: DispatchQueue
  private let responseDispatchQueue: DispatchQueue
  
  public init(string: String = UUID().uuidString) {
    
    requestDispatchQueue = DispatchQueue(
      label: "no.http.dispatch.queue.request." + string,
      qos: .utility)
    
    responseDispatchQueue = DispatchQueue(
      label: "no.http.dispatch.queue.response." + string,
      qos: .utility)
    
    super.init()
  }
  
  deinit {
    
    session.invalidateAndCancel()
  }
}

// MARK: - PicFindrHTTPClientProtocol

extension NOHTTPClient: URLSessionDelegate { }

extension NOHTTPClient: NOHTTP {
  
  public func canelTasksBy(url: URL) {
    
    requestDispatchQueue.async { [weak self] in
      
      guard let `self` = self else { return }
      
      self.session.getAllTasks { task in
        
        task.filter({ $0.originalRequest?.url == url
          || $0.currentRequest?.url == url })
          .forEach { $0.cancel() }
      }
    }
  }
  
  public func cancelTasks() {
    
    requestDispatchQueue.async { [weak self] in
      
      guard let `self` = self else { return }
      
      self.session.getAllTasks {
        $0.forEach({ $0.cancel() })
      }
    }
  }
  
  public var httpHeaders: NOHTTPHeaders? {
    
    get { sessionConfiguration.httpAdditionalHeaders as? [String: String]}
    set { sessionConfiguration.httpAdditionalHeaders = newValue }
  }
  
  public var cachePolicy: NSURLRequest.CachePolicy {
    
    get { sessionConfiguration.requestCachePolicy }
    set { sessionConfiguration.requestCachePolicy = newValue }
  }
  
  public func execute(
    _ request: NOHTTPRequest,
    with completionHandler: @escaping NOHTTPResponseClosure) {
      
      requestDispatchQueue
        .async { [weak self] in
          
          guard let `self` = self else { return }
          
          guard let request = request.request else {
            
            self.responseDispatchQueue
              .async {
            
                completionHandler(.failure(error: NOHTTPError.badURLReqeust,
                                           response: nil))
              }
            
            return
          }
          
          let task = self.session
            .dataTask(with: request) { [weak self] data, response, error in
              
              guard let `self` = self else { return }
              
              guard let response = response as? HTTPURLResponse else {
                
                self.responseDispatchQueue
                  .async {
                    completionHandler(.failure(error: NOHTTPError.noHTTPURLResponse(error: error),
                                               response: nil))
                  }
                
                return
              }
              
              if let error = error {
                
                self.responseDispatchQueue
                  .async {
                    completionHandler(.failure(error: NOHTTPError.failure(error: error),
                                               response: response))
                  }
                return
              }
              
              guard let data = data else {
                
                self.responseDispatchQueue
                  .async {
                    completionHandler(.failure(error: NOHTTPError.noData,
                                               response: response))
                  }
                return
              }
              
              self.responseDispatchQueue
                .async {
                  completionHandler(.success(data: data,
                                             response: response))
                }
            }
          task.resume()
          
        }
    }
}
