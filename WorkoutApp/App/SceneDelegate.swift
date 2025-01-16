//
//  SceneDelegate.swift
//  WorkoutApp
//
//  Created by Peter on 07.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let customNavigationController = UINavigationController(rootViewController: TabBarController())
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = customNavigationController
        window?.makeKeyAndVisible()
        
    }
}

