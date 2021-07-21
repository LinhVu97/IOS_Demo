//
//  NewsViewController.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 18/07/2021.
//

import UIKit

class NewsViewController: UIViewController {
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

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.newsData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = result?.newsData[indexPath.row] else {
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                       for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundStatusView.isHidden = true
        cell.star.isHidden = true
        cell.statusLabel.isHidden = true
        cell.setupCell(image: data.image,
                       time: data.time,
                       title: data.title,
                       description: data.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
