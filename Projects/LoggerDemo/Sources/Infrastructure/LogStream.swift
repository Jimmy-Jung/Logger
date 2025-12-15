// LogStream.swift
// LoggerDemo
//
// Created by jimmy on 2025-12-15.

import Foundation
import Combine
import Logger

@MainActor
final class LogStream: ObservableObject {
    
    static let shared = LogStream()
    
    @Published private(set) var logs: [LogMessage] = []
    
    private let maxLogs = 500
    
    private init() {}
    
    func append(_ message: LogMessage) {
        logs.append(message)
        
        if logs.count > maxLogs {
            logs.removeFirst(logs.count - maxLogs)
        }
    }
    
    func append(contentsOf messages: [LogMessage]) {
        for message in messages {
            append(message)
        }
    }
    
    func clear() {
        logs.removeAll()
    }
}

