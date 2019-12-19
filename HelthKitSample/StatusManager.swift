//
//  StatusManager.swift
//  HelthKitSample
//
//  Created by Seiya Maeda on 2019/12/19.
//  Copyright © 2019 Seiya Maeda. All rights reserved.
//

import Foundation
import UIKit

class StatusManager {
    let manager = UserDefaults.standard

    func getStatusForAuthorization() -> String {
        let statusForAuthorization = manager.object(forKey: "StatusForAuthorization")
        return (statusForAuthorization != nil) ? statusForAuthorization as! String : "謎のエラーが発生しました。(2)"
    }

    func getStatusForHealthDataAvailable() -> String {
        let statusForHealthDataAvailable = manager.object(forKey: "StatusForHealthDataAvailable")
        return (statusForHealthDataAvailable != nil) ? statusForHealthDataAvailable as! String : "謎のエラーが発生しました。(2)"
    }
    
    func updateStatusForAuthorization(isAuthorized: Bool) {
        let result = isAuthorized ? "HealthKitとの連携は許可されています。" : "HealthKitとの連携は許可されていません。"
        manager.set(result, forKey: "StatusForAuthorization")
    }

    func updateStatusForHealthDataAvailable(isAvailable: Bool) {
        let result = isAvailable ? "HealthKitが利用可能なデバイスです。" : "HealthKitが利用できないデバイスです。新しく買ってね"
        manager.set(result, forKey: "StatusForHealthDataAvailable")
    }
}
