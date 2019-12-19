//
//  StatusViewController.swift
//  HelthKitSample
//
//  Created by Seiya Maeda on 2019/12/19.
//  Copyright © 2019 Seiya Maeda. All rights reserved.
//

import Foundation
import UIKit

class StatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let statusManager = StatusManager()
    
    private let sectionTitles = ["Status for Authorization", "Status for Health Data Available"]

    override func viewDidLoad() {
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StatusCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel!.text = statusManager.getStatusForAuthorization()
        case 1:
            cell.textLabel!.text = statusManager.getStatusForHealthDataAvailable()
        default:
            break
        }
        return cell
    }
}
