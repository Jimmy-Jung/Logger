// swift-tools-version: 6.0
// Package.swift
// Logger
//
// Created by jimmy on 2025-12-15.

import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // 특정 패키지 프로덕트의 타입을 커스터마이징
        // 기본값은 .staticFramework
        // productTypes: ["Alamofire": .framework]
        productTypes: [:]
    )
#endif

let package = Package(
    name: "Logger",
    dependencies: [
        // 외부 의존성을 여기에 추가하세요:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // 자세한 내용은 https://docs.tuist.io/documentation/tuist/dependencies 참조
    ]
)

