//
//  CustomTableViewCell.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 18/07/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var timerCell: UILabel!
    @IBOutlet weak var imageTimer: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var backgroundStatusView: UIView!
    @IBOutlet weak var star: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var handler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCell.roundCorners()
        setupBackgroundStatus()
    }
    
    // Setup Background Status
    private func setupBackgroundStatus() {
        backgroundStatusView.layer.cornerRadius = 15
        backgroundStatusView.layer.masksToBounds = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(change))
        recognizer.numberOfTouchesRequired = 1
        backgroundStatusView.isUserInteractionEnabled = true
        backgroundStatusView.addGestureRecognizer(recognizer)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layoutIfNeeded()
        imageCell.roundCorners()
        backgroundStatusView.layoutIfNeeded()
    }
    
    func setupCell(image: String, time: String, title: String, description: String) {
        imageCell.image = UIImage(named: image)
        timerCell.text = time
        titleCell.text = title
        descriptionCell.text = description
    }

    @objc func change() {
        handler?()
    }
}
