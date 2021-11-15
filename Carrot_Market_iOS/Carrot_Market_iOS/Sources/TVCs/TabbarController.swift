//
//  TabbarController.swift
//  Carrot_Market_iOS
//
//  Created by 정은희 on 2021/11/07.
//

import UIKit

class TabbarController: UITabBarController {

    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabbar()
    }
    
    // MARK: - Custom Method Part
    func setTabbar() {
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC"),
              let lifeVC = self.storyboard?.instantiateViewController(identifier: "LifeVC"),
              let aroundVC = self.storyboard?.instantiateViewController(identifier: "AroundVC"),
              let chatVC = self.storyboard?.instantiateViewController(identifier: "ChatVC"),
              let myCarrotVC = self.storyboard?.instantiateViewController(identifier: "MyCarrotVC")
            else { return }
        

        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        lifeVC.tabBarItem = UITabBarItem(title: "동네생활", image: UIImage(named: "townIcon"), selectedImage: UIImage(named: "townIconFill"))
        aroundVC.tabBarItem = UITabBarItem(title: "내 근처", image: UIImage(named: "myAroundIcon"), selectedImage: UIImage(named: "myAroundIconFill"))
        chatVC.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(named: "chatIcon"), selectedImage: UIImage(named: "chatIconFill"))
        myCarrotVC.tabBarItem = UITabBarItem(title: "나의 당근", image: UIImage(named: "myCarrotIcon"), selectedImage: UIImage(named: "myCarrotIconFill"))
        
        
        setViewControllers([homeVC, lifeVC, aroundVC, chatVC, myCarrotVC], animated: true)
        
    }

}
