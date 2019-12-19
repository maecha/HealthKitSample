//
//  HealthKit.swift
//  HelthKitSample
//
//  Created by Seiya Maeda on 2019/12/19.
//  Copyright © 2019 Seiya Maeda. All rights reserved.
//

import Foundation
import HealthKit

enum HealthKitAuthorizationRequestStatus: Int {
    case unknown
    case shouldRequest
    case unnecessary
}

class HealthKit {
    let healthKitStore: HKHealthStore = HKHealthStore()
    let writeTypes = Set([
        HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
        HKWorkoutType.workoutType()
    ])
    let readTypes = Set([
        HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
        HKWorkoutType.workoutType()
    ])
    let statusManager = StatusManager()

    init() {
        _ = checkAuthorization()
    }
    
    func checkAuthorization() -> Bool {
        var isEnabled = true

        // 利用しているデバイスでHealthKitが利用可能か調べる
        if HKHealthStore.isHealthDataAvailable() {
            // 許可されているかを確認
            healthKitStore.requestAuthorization(toShare: writeTypes, read: readTypes) { (success, error) -> Void in
                isEnabled = success
                self.statusManager.updateStatusForAuthorization(isAuthorized: true)
            }
        } else {
            isEnabled = false
            self.statusManager.updateStatusForAuthorization(isAuthorized: false)
        }
        
        checkGetRequestStatusForAuthorization()

        return isEnabled
    }
    
    /// HealthKitとの連携が許可されているか確認する
    private func checkGetRequestStatusForAuthorization() {
        healthKitStore.getRequestStatusForAuthorization(toShare: writeTypes, read: readTypes) { status, _ in
            let result = (status.rawValue == HealthKitAuthorizationRequestStatus.unnecessary.rawValue)
            self.statusManager.updateStatusForHealthDataAvailable(isAvailable: result)
        }
    }

    func recentStepsOfDay(completion: @escaping(_ steps: Int, _ error: NSError?) -> Void) {
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        let typeStepCount = HKSampleType.quantityType(forIdentifier: .stepCount)!
        
        let query = HKStatisticsQuery(quantityType: typeStepCount, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            if let e = error {
                print("recentStepsOfDay - Error: \(e.localizedDescription)")
                return
            }
            guard let result = result, let sum = result.sumQuantity() else {
                completion(Int(0), error as NSError?)
                return
            }
            let steps = Int(sum.doubleValue(for: HKUnit.count()))
            completion(steps, error as NSError?)
        }
        self.healthKitStore.execute(query)
    }
    
    func runningWorkOuts(_ completion: (([AnyObject]?, NSError?) -> Void)!) {
        let predicate =  HKQuery.predicateForWorkouts(with: HKWorkoutActivityType.running)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let sampleQuery = HKSampleQuery(sampleType: HKWorkoutType.workoutType(),
                                        predicate: predicate,
                                        limit: 0,
                                        sortDescriptors: [sortDescriptor]) {
                                            (sampleQuery, results, error ) -> Void in
                                            if let e = error {
                                                print("runningWorkOuts - Error: \(e.localizedDescription)")
                                                return
                                            }
                                            completion!(results, error as NSError?)
        }
        self.healthKitStore.execute(sampleQuery)
    }
}
