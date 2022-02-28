//
//  NetworkMonitor.swift
//  iBooks
//
//  Created by Logesh Vijayan on 2022-02-28.
//

import Foundation
import Network

//MARK: - Class
final class NetworkMonitor {
    
    //MARK: - Singleton Declration
    static let shared = NetworkMonitor()
    
    //MARK: Variables
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public private(set) var isConnected: Bool = false
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    deinit {
        stopMonitoring()
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler =  { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
}
