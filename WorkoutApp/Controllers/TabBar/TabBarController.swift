//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    //MARK: - Comstant
    
    enum Colors {
        static var active = UIColor(named: "Greenn")
        static var inactive = UIColor.white
        static var background = UIColor.black
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
    
    //MARK: - Set Up

    func configureTabs() {
        
        tabBar.tintColor = Colors.active
        tabBar.unselectedItemTintColor = Colors.inactive
        tabBar.backgroundColor = Colors.background
        tabBar.barTintColor = Colors.background
        tabBar.barStyle = .black
        tabBar.layer.cornerRadius = 15
        tabBar.isTranslucent = false
        
        let mainViewController = MainViewController()
        let trainViewController = TrainViewController()
        let threeViewController = NewsViewController()
        let nutritionViewController = NutritionViewController()
        let accountViewController = AccountViewController()

        mainViewController.tabBarItem = .init(
            title: "Home",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        
        trainViewController.tabBarItem = .init(
            title: "Train",
            image: UIImage(systemName: "dumbbell.fill"),
            tag: 1
        )
        
        threeViewController.tabBarItem = .init(
            title: "News",
            image: UIImage(systemName: "filemenu.and.cursorarrow"),
            tag: 2
        )
        
        nutritionViewController.tabBarItem = .init(
            title: "Nutrition",
            image: UIImage(systemName: "fork.knife"),
            tag: 3
        )
        
        accountViewController.tabBarItem = .init(
            title: "Account",
            image: UIImage(systemName: "person.fill"),
            tag: 4
        )

        setViewControllers([mainViewController, trainViewController, threeViewController, nutritionViewController, accountViewController], animated: true)
    }
}

