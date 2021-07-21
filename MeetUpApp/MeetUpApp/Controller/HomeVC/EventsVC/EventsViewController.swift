//
//  EventsViewController.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 18/07/2021.
//

import UIKit

class EventsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var result: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        parseJSON()
    }
    
    // Setup Table View
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        let nib = UINib(nibName: CustomTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    // Parse JSON
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "Data",
                                          ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let json = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: json)
        } catch {
            alertError(title: Localized.error, message: Localized.cannotLoadData)
        }
    }
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.eventsData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = result?.eventsData[indexPath.row] else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                       for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.timerCell.textColor = .purple
        cell.imageTimer.image = UIImage(named: "Group 15")
        cell.setupCell(image: data.image,
                       time: data.time,
                       title: data.title,
                       description: data.description)
        // Change Status
        cell.handler = { [weak self] in
            let vc = StatusViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.completionHandler = { [weak self] in
                self?.result?.eventsData[indexPath.row].status = $0
                self?.tableView.reloadData()
            }
            self?.present(vc, animated: true, completion: nil)
        }
        switch data.status {
        case 1:
            cell.statusLabel.text = "Joined"
            cell.statusLabel.textColor = .red
            cell.star.image = UIImage(named: "icon_starRed")
        case 2:
            cell.statusLabel.text = "Can Participate"
            cell.statusLabel.textColor = .green
            cell.star.image = UIImage(named: "icon_starGreen")
        default:
            cell.statusLabel.text = "Join"
            cell.statusLabel.textColor = .gray
            cell.star.image = UIImage(named: "icon_star")
        }
        return cell
    }
}
