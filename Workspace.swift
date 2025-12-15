// Workspace.swift
// Logger
//
// Created by jimmy on 2025-12-15.

import ProjectDescription

let workspace = Workspace(
    name: "Logger",
    projects: [
        "Projects/Logger"
        // 외부 SDK 모듈은 해당 SDK 설치 후 주석 해제
        // "Projects/LoggerSentry",
        // "Projects/LoggerDatadog",
        // "Projects/LoggerFirebase"
    ]
)

