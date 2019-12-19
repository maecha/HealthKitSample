//
//  ViewController.swift
//  HelthKitSample
//
//  Created by Seiya Maeda on 2019/12/10.
//  Copyright © 2019 Seiya Maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stepLabel: UILabel!
    
    let healthKit = HealthKit()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        healthKit.recentStepsOfDay(completion: { steps, error in
            DispatchQueue.main.async {
                self.stepLabel.text = String(steps)
            }
        })
        healthKit.runningWorkOuts({ results, error in
            print("runningWorkOuts: \(String(describing: results))")
        })
    }
}
