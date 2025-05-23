//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Ума Ильясова on 22.04.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)

        let feedViewController = FeedViewController()
        feedViewController.title = "Лента"

        let profileViewController = ProfileViewController()
        profileViewController.title = "Профиль"

        // UINavigationControllers
        let feedNavController = UINavigationController(rootViewController: feedViewController)
        let profileNavController = UINavigationController(rootViewController: profileViewController)

        // UITabBarController
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [feedNavController, profileNavController]

        // Tab Bar Items
        feedNavController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "house"), tag: 0)
        profileNavController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()

        self.window = window
    }
}

