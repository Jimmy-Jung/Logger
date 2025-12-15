// LogLevelBadge.swift
// LoggerDemo
//
// Created by jimmy on 2025-12-15.

import SwiftUI
import Logger

struct LogLevelBadge: View {
    let level: LogLevel
    
    var body: some View {
        Text(level.name)
            .font(Theme.Typography.monoSmall)
            .fontWeight(.medium)
            .foregroundColor(level.color)
            .padding(.horizontal, Theme.Spacing.sm)
            .padding(.vertical, Theme.Spacing.xs)
            .background(level.color.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: Theme.Radius.sm))
    }
}

#Preview {
    VStack(spacing: Theme.Spacing.sm) {
        LogLevelBadge(level: .verbose)
        LogLevelBadge(level: .debug)
        LogLevelBadge(level: .info)
        LogLevelBadge(level: .warning)
        LogLevelBadge(level: .error)
        LogLevelBadge(level: .fatal)
    }
    .padding()
    .background(Theme.Colors.background)
}

