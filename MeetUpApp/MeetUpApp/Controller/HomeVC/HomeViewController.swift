//
//  HomeViewController.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 15/07/2021.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak private var newsButton: UIButton!
    @IBOutlet weak private var eventsButton: UIButton!
    @IBOutlet weak private var horizontalBar: UIView!
    @IBOutlet weak private var leadingHorizontalBar: NSLayoutConstraint!
    @IBOutlet weak private var scrollView: UIScrollView!
    @IBOutlet weak private var leftView: UIView!
    @IBOutlet weak private var rightView: UIView!
    
    let newsView = NewsViewController()
    let eventsView = EventsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // Setup View
    private func setupView() {
        scrollView.delegate = self
        setUpTabLayout(viewControllerLeft: newsView,
                       viewControllerRight: eventsView,
                       leftViewInput: leftView,
                       rightViewInput: rightView)
    }
    
    // MARK: - Button
    @IBAction func btnNews(_ sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    @IBAction func btnEvents(_ sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: scrollView.frame.width, y: scrollView.contentOffset.y), animated: true)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        leadingHorizontalBar.constant = scrollView.contentOffset.x / 2
        if scrollView.contentOffset.x >= scrollView.bounds.width / 2 {
            if scrollView.contentOffset.x == scrollView.bounds.width {
                scrollView.setContentOffset(CGPoint(x: scrollView.bounds.width,
                                                    y: scrollView.contentOffset.y),
                                            animated: false)
            }
        } else {
            if scrollView.contentOffset.x == 0 {
                scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
                scrollView.endEditing(true)
            }
        }
    }
}
