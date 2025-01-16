//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Peter on 09.12.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    // MARK: - Constant
    enum Colors {
        static var active = UIColor(named: "Greenn")
        static var inactive = UIColor.white
        static var background = UIColor.black
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }
    
    // MARK: - SetUp
    func setUpTabs() {
        tabBar.tintColor = Colors.active
        tabBar.unselectedItemTintColor = Colors.inactive
        tabBar.backgroundColor = Colors.background
        tabBar.barTintColor = Colors.background
        tabBar.barStyle = .black
        tabBar.layer.cornerRadius = 0
        tabBar.isTranslucent = false
        
        let homeViewController = HomeViewController()
        let trainViewController = TrainViewController()
        let threeViewController = NewsViewController()
        let nutritionViewController = NutritionViewController()
        let accountViewController = AccountViewController()

        homeViewController.tabBarItem = .init(
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

        setViewControllers(
            [
                homeViewController,
                trainViewController,
                threeViewController,
                nutritionViewController,
                accountViewController
            ],
            animated: true
        )
    }
}
