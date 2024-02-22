//
//  ConsentManager.swift
//  LRAtsSDKSample
//
//  Created by Meris Skenderovic on 2/21/24.
//
//  Copyright © 2024 Liveramp. All rights reserved.
//

import Foundation

/// This class is for demonstration purposes only, do not use this in production.
class ConsentManager {
    private static let shared = ConsentManager()
    
    private init() {}
    
    static func simulateUserConsent() {
        shared.giveGDPRConsent()
        shared.giveCCPAConsent()
        shared.giveGPPNationalConsent()
    }
    
    private func giveGDPRConsent() {
        UserDefaults.standard.set("CPKZ42oPKZ5YtADABCENBlCgAP_AAAAAAAAAAwwAQAwgDDABADCAAA.YAAAAAAAA4AA", forKey: "IABTCF_TCString")
        UserDefaults.standard.set("1111111111", forKey: "IABTCF_PurposeConsents")
        UserDefaults.standard.set("0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001", forKey: "IABTCF_VendorConsents")
    }
    
    private func giveCCPAConsent() {
        UserDefaults.standard.set("1YNN", forKey: "IABUSPrivacy_String")
    }
    
    private func giveGPPNationalConsent() {
        UserDefaults.standard.set("DBAA", forKey: "IABGPP_HDR_GppString")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_Version")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_SharingNotice")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_SaleOptOutNotice")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_SharingOptOutNotice")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_TargetedAdvertisingOptOutNotice")
        UserDefaults.standard.set(0, forKey: "IABGPP_USNAT_SensitiveDataProcessingOptOutNotice")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_SensitiveDataLimitUseNotice")
        UserDefaults.standard.set(2, forKey: "IABGPP_USNAT_SaleOptOut")
        UserDefaults.standard.set(2, forKey: "IABGPP_USNAT_SharingOptOut")
        UserDefaults.standard.set(2, forKey: "IABGPP_USNAT_TargetedAdvertisingOptOut")
        UserDefaults.standard.set("0_0_0_0_0_0_0_0_0_0_0_0", forKey: "IABGPP_USNAT_SensitiveDataProcessing")
        UserDefaults.standard.set("0_0", forKey: "IABGPP_USNAT_KnownChildSensitiveDataConsents")
        UserDefaults.standard.set(2, forKey: "IABGPP_USNAT_PersonalDataConsents")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_MspaCoveredTransaction")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_MspaOptOutOptionMode")
        UserDefaults.standard.set(1, forKey: "IABGPP_USNAT_MspaServiceProviderMode")
    }
}
