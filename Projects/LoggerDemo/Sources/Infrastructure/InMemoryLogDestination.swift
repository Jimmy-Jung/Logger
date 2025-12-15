// InMemoryLogDestination.swift
// LoggerDemo
//
// Created by jimmy on 2025-12-15.

import Foundation
import Logger

actor InMemoryLogDestination: LogDestination {
    
    let identifier = "in-memory"
    var minLevel: LogLevel = .verbose
    var isEnabled: Bool = true
    
    private let stream: LogStream
    
    init(stream: LogStream) {
        self.stream = stream
    }
    
    func log(_ message: LogMessage) async {
        guard shouldLog(message) else { return }
        await MainActor.run {
            stream.append(message)
        }
    }
    
    func flush(_ messages: [LogMessage]) async {
        let filtered = messages.filter { shouldLog($0) }
        guard !filtered.isEmpty else { return }
        await MainActor.run {
            stream.append(contentsOf: filtered)
        }
    }
}

