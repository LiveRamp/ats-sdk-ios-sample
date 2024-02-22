//
//  UIExtensions.swift
//  LRAtsSDKSample
//
//  Created by Meris Skenderovic on 2/21/24.
//
//  Copyright © 2024 Liveramp. All rights reserved.
//

import UIKit
import LRAtsSDK

extension LREnvelope {
    var stringRepresentation: String {
        var envelopeResultText: [String] = [String]()
        if let rampID = envelope {
            envelopeResultText.append("envelope:\n\(rampID)")
        }
        if let envelope24 = envelope24 {
            envelopeResultText.append("envelope24:\n\(envelope24)")
        }
        if let envelope25 = envelope25 {
            envelopeResultText.append("envelope25:\n\(envelope25)")
        }
        return envelopeResultText.joined(separator: "\n")
    }
}

extension CALayer {
    open override func setValue(_ value: Any?, forKey key: String) {
        guard key == "borderColor", let color = value as? UIColor else {
            super.setValue(value, forKey: key)
            return
        }
        self.borderColor = color.cgColor
    }
}
