//
//  TabbarViewController.swift
//  MeetUpApp
//
//  Created by Vũ Linh on 15/07/2021.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create instance of view controllers
        let homeVC = HomeViewController()
        let nearVC = NearViewController()
        let listVC = ListViewController()
        let profileVC = ProfileViewController()

        // Set item tab bar
        homeVC.tabBarItem = UITabBarItem(title: Localized.home,
                                         image: UIImage(named: "icon-home"), tag: 0)
        nearVC.tabBarItem = UITabBarItem(title: Localized.near,
                                         image: UIImage(named: "icon-located"), tag: 1)
        listVC.tabBarItem = UITabBarItem(title: Localized.list,
                                         image: UIImage(named: "icon-browse"), tag: 2)
        profileVC.tabBarItem = UITabBarItem(title: Localized.profile,
                                            image: UIImage(named: "icon-profile"), tag: 3)

        // assign view controllers to tab bar
        self.setViewControllers([homeVC, nearVC, listVC, profileVC], animated: true)
        self.tabBar.tintColor = .purple
    }
}
