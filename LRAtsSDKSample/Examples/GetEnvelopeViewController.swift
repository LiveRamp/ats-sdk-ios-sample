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
    @IBOutlet weak var configIDTextField: UITextField!
    @IBOutlet weak var envelopeResultTextView: UITextView!
    @IBOutlet weak var logTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LogObserver.observe(on: logTextView)
    }
    
    @IBAction func getEnvelopeButtonPressed(_ sender: UIButton) {
        configureLRAtsExample()
    }
    
    private func configureLRAtsExample() {
        Task {
            guard let configID = configIDTextField.text else { return }
            // You should provide your configID here
            
            let lrAtsConfiguration = LRAtsConfiguration(
                configID: configID,
                logToFileEnabled: true // Logging is enabled for debugging purposes, do not use it in your production app!
            )
            
            do {
                // SDK should be initialized only once
                // Make sure you have ATT consent and user consent to initialize and get envelope successfully
                try await LRAts.shared.initialize(with: lrAtsConfiguration)
                // You can use email, phone or envelope identifier to get an envelope
                let identifier = LREmailIdentifier("example@mail.com")
//                let identifier = LRPhoneNumberIdentifier("0123456789")
//                let identifier = LREnvelopeIdentifier(<#envelope value#>)
                let envelope = try await LRAts.shared.getEnvelope(identifier)
                envelopeResultTextView.text = envelope.stringRepresentation
            } catch {
                envelopeResultTextView.text = error.localizedDescription
            }
        }
    }
}
