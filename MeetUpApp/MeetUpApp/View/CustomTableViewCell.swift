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
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    @IBOutlet weak var backgroundStatusView: UIView!
    @IBOutlet weak var star: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCell.roundCorners()
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
}
