//
//  GetEnvelopeViewController.swift
//  LRAtsSDKSample
//
//  Created by Najdan Tomic on 2/9/24.
//
//  Copyright © 2024 Liveramp. All rights reserved.
//

import UIKit
import LRAtsSDK

class GetEnvelopeViewController: UIViewController {
    @IBOutlet weak var appIDTextField: UITextField!
    @IBOutlet weak var envelopeResultTextView: UITextView!
    @IBOutlet weak var logTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LogObserver.observe(on: logTextView)
    }
    
    @IBAction func getEnvelopeButtonPressed(_ sender: UIButton) {
        Task {
            guard let appID = appIDTextField.text else { return }
            // You should provide your appID here
            // isLogToFileEnabled is set to true for debugging purposes, do not use it in your production app
            let lrAtsConfiguration = LRAtsConfiguration(appId: appID, logToFileEnabled: true)
            do {
                // SDK should be initialized only once
                // Make sure you have ATT consent and user consent to initialize and get envelope successfully
                try await LRAts.shared.initialize(with: lrAtsConfiguration)
                // You can use email, phone, envelope or custom identifier to get an envelope
                let identifier = LREmailIdentifier("example@mail.com")
//                let identifier = LRPhoneNumberIdentifier("0123456789")
//                let identifier = LREnvelopeIdentifier(<#envelope value#>)
//                let identifier = LRCustomIdentifier("54321:abc123")
                let envelope = try await LRAts.shared.getEnvelope(identifier)
                envelopeResultTextView.text = envelope.stringRepresentation
            } catch {
                envelopeResultTextView.text = error.localizedDescription
            }
        }
    }
}
