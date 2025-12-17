// LoggerDemoApp.swift
// LoggerDemo
//
// Created by jimmy on 2025-12-15.

import Logger
import SwiftUI

@main
struct LoggerDemoApp: App {
    init() {
        Task {
            await LoggerSetup.configure()
            await Logger.async.info("LoggerDemo 앱이 시작되었습니다", category: "App")
        }
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(.dark)
        }
    }
}
