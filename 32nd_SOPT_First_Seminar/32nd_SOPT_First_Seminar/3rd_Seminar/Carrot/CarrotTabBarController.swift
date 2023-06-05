//
//  CarrotTabBarController.swift
//  32nd_SOPT_Seminar
//
//  Created by 정채은 on 2023/05/27.
//

import UIKit

class CarrotTabBarController: UITabBarController {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setTabBar()
    }
}

extension CarrotTabBarController {
    
    private func makeTabBar(viewController: UIViewController,
                            title: String, image: UIImage, tag: Int) -> UIViewController {
        
        let tab = UINavigationController(rootViewController: viewController)
        tab.isNavigationBarHidden = true
        tab.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        
        return tab
    }
    
    private func setTabBar() {
        
        let home = makeTabBar(viewController: CarrotViewController(),
                              title: "홈", image: UIImage(systemName: "house")!, tag: 0)
        let menu = makeTabBar(viewController: CarrotStarViewController(),
                              title: "필터", image: UIImage(systemName: "line.3.horizontal.decrease.circle")!, tag: 1)
        
        let tabs = [home, menu]
        
        self.setViewControllers(tabs, animated: false)
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
    }
}
