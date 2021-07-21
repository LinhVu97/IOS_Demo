//
//  StatusViewController.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 19/07/2021.
//

import UIKit

class StatusViewController: UIViewController {
    @IBOutlet weak var tableStatus: UITableView!
    
    var items = ["Join", "Joined", "Can Participate", "joid", "aj"]
    var completionHandler: ((Int) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        setupTableView()
    }
    
    // Setup Table View
    private func setupTableView() {
        tableStatus.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableStatus.delegate = self
        tableStatus.dataSource = self
    }
}

extension StatusViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableStatus.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completionHandler?(indexPath.row)
        dismiss(animated: true, completion: nil)
    }
}
