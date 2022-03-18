//
//  MainTabBar.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 7.06.21.
//

import UIKit

final class MainTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
}

extension MainTabBar: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController is ImagePickerViewController {
            print("hello")
        }
    }
}

