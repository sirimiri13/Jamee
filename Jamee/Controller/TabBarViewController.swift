//
//  TabBarViewController.swift
//  Jamee
//
//  Created by Huong Lam on 12/27/2020.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews();
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
        self.tabBar.tintColor = UIColor.pinkBackground()
        // Do any additional setup after loading the view.
    }
    func setupViews() {
        let tabBarItems = tabBar.items!
        tabBarItems[0].title = nil
        tabBarItems[0].image = UIImage(systemName: "house.fill")
        tabBarItems[1].title = nil
        tabBarItems[1].image = UIImage(systemName: "mappin.and.ellipse")
        tabBarItems[2].title = nil
        tabBarItems[2].image = UIImage(systemName: "creditcard.fill")
        tabBarItems[3].title = nil
        tabBarItems[3].image = UIImage(systemName: "cart.fill")


    }

}
