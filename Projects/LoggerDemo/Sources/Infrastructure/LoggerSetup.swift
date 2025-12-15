// LoggerSetup.swift
// LoggerDemo
//
// Created by jimmy on 2025-12-15.

import Foundation
import Logger

/// Logger 초기화 설정
///
/// 데모 앱에서 사용할 Logger를 구성합니다.
/// - OSLog 출력 (PrettyLogFormatter.verbose) - Xcode 콘솔 및 Console.app
/// - File 출력 (JSONLogFormatter) - 디바이스에 로그 파일 저장
/// - InMemoryLogDestination (앱 내 로그 뷰어용)
/// - 민감정보 마스킹 활성화
///
/// ## 사용 예시
/// ```swift
/// Task {
///     await LoggerSetup.configure()
/// }
/// ```
///
/// ## 구성된 Destination
/// | Destination | 용도 |
/// |------------|------|
/// | OSLog | Xcode 콘솔, Console.app, Instruments 연동 (PrettyLogFormatter 적용) |
/// | File | 디바이스에 JSON 형식 로그 파일 저장 (7일 보관) |
/// | InMemory | LogViewer 화면에서 실시간 로그 확인 |
///
/// ## 로그 파일 위치
/// `Library/Caches/Logs/log-YYYY-MM-DD.log`
///
/// - Note: 앱 시작 시 `LoggerDemoApp.init()`에서 호출됩니다.
enum LoggerSetup {
    
    /// Logger 초기화
    ///
    /// 앱 시작 시 한 번 호출하여 Logger를 구성합니다.
    /// `Logger.shared` 인스턴스가 설정됩니다.
    ///
    /// - Important: MainActor에서 실행되어야 합니다.
    @MainActor
    static func configure() async {
        let stream = LogStream.shared
        let inMemoryDestination = InMemoryLogDestination(stream: stream)
        
        _ = await LoggerBuilder()
            .addOSLog(
                subsystem: "com.logger.LoggerDemo",
                formatter: PrettyLogFormatter.verbose
            )
            .addFile(
                minLevel: .debug,
                retentionPolicy: .default
            )
            .addDestination(inMemoryDestination)
            .with(configuration: .debug)
            .withDefaultSanitizer()
            .buildAsShared()
    }
    
    /// 로그 파일 디렉토리 URL
    static var logDirectory: URL {
        let cachesDir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return cachesDir.appendingPathComponent("Logs", isDirectory: true)
    }
}
