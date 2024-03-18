//
//  LogObserver.swift
//  LRAtsSDKSample
//
//  Created by Meris Skenderovic on 2/28/24.
//
//  Copyright © 2024 Liveramp. All rights reserved.
//

import Foundation
import UIKit

class LogObserver: NSObject, NSFilePresenter {
    let presentedItemOperationQueue: OperationQueue = OperationQueue.main
    var presentedItemURL: URL?
    
    private static let shared = LogObserver()
    private weak var textView: UITextView?
    
    static func observe(on textView: UITextView) {
        if let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let logsDirectoryURL = documentsDirectoryURL.appendingPathComponent("ats-sdk-ios/logs/")
            try? FileManager.default.removeItem(at: logsDirectoryURL)
            try? FileManager.default.createDirectory(at: logsDirectoryURL, withIntermediateDirectories: true)
            
            let logFileURL = logsDirectoryURL.appendingPathComponent("\(currentDateString).log")
            FileManager.default.createFile(atPath: logFileURL.path, contents: nil)
            
            shared.presentedItemURL = logFileURL
            shared.textView = textView
            NSFileCoordinator.addFilePresenter(shared)
        }
    }
    
    deinit {
        NSFileCoordinator.removeFilePresenter(self)
    }
    
    private static var currentDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    func presentedItemDidChange() {
        updateTextViewWithFileContent()
    }

    private func updateTextViewWithFileContent() {
        guard let presentedItemURL = presentedItemURL, let fileContents = try? String(contentsOf: presentedItemURL, encoding: .utf8) else {
            textView?.text = "Error occurred while reading log file."
            textView?.scrollToBottom()
            return
        }
        textView?.text = formatLogsIfPossible(fileContents)
        textView?.scrollToBottom()
    }
    
    private func formatLogsIfPossible(_ logs: String) -> String {
        let formattedLogs = logs.split(separator: "\n").map { String($0).components(separatedBy: ")}: ")[1] }.joined(separator: "\n\n")
        return formattedLogs
    }
}
