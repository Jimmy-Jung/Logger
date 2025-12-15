// Project.swift
// LoggerDemo
//
// Created by jimmy on 2025-12-15.

import ProjectDescription

let project = Project(
    name: "LoggerDemo",
    organizationName: "com.logger",
    targets: [
        .target(
            name: "LoggerDemo",
            destinations: .iOS,
            product: .app,
            bundleId: "com.logger.LoggerDemo",
            deploymentTargets: .iOS("15.0"),
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": [
                    "UIColorName": "LaunchBackground"
                ],
                "UISupportedInterfaceOrientations": [
                    "UIInterfaceOrientationPortrait"
                ]
            ]),
            sources: ["Sources/**"],
            resources: [],
            dependencies: [
                .project(target: "Logger", path: "../Logger")
            ]
        )
    ],
    schemes: [
        .scheme(
            name: "LoggerDemo",
            shared: true,
            buildAction: .buildAction(targets: ["LoggerDemo"]),
            runAction: .runAction(
                configuration: .debug,
                arguments: .arguments(
                    launchArguments: [
                        .launchArgument(name: "-logLevel DEBUG", isEnabled: false),
                        .launchArgument(name: "-logFilter Network,Auth", isEnabled: false),
                        .launchArgument(name: "-sampleRate 1.0", isEnabled: false),
                        .launchArgument(name: "-bufferSize 100", isEnabled: false),
                        .launchArgument(name: "-flushInterval 5.0", isEnabled: false),
                        .launchArgument(name: "-disableConsole", isEnabled: false),
                        .launchArgument(name: "-disableOSLog", isEnabled: false),
                        .launchArgument(name: "-disableFile", isEnabled: false),
                        .launchArgument(name: "-disableMasking", isEnabled: false),
                        .launchArgument(name: "-enableMasking", isEnabled: false)
                    ]
                )
            ),
            archiveAction: .archiveAction(configuration: .release)
        )
    ]
)

