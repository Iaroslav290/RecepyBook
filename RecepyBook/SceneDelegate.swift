//
//  SceneDelegate.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-04.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var containerViewController: ContainerViewController?
    var userDefault = UserDefaults.standard

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
//        userDefault.setValue(false, forKey: "isLogin")
        let isLogin = userDefault.object(forKey: "isLogin") as? Bool ?? false
        
        if isLogin {
//            startApp()
            let userId = (Auth.auth().currentUser?.uid)!
                        Firestore.firestore().collection("users").document(userId).getDocument { (snapshot, error) in
                            if let error = error {
                                print("Error fetching user data: \(error.localizedDescription)")
                                // Handle the error, possibly by showing the login screen again
                                self.startFirstScreen()
                                return
                            }

                            if let snapshot = snapshot, let userData = snapshot.data(), let userRole = userData["role"] as? String {
                                if userRole == "admin" {
                                    self.startAdminApp()
                                } else {
                                    self.startUserApp()
                                }
                            } else {
                                // User data not found or role information missing, handle the scenario as per your app's logic
                                // For example, show the login screen again
                                self.startFirstScreen()
                            }
                        }
        }else {
            startFirstScreen()
        }
        
    }
    @objc func toggleMenu(_ sender: UIButton) {
            containerViewController?.toggleMenu()
        }
    
//    func startApp() {
//        let controller = ContainerViewController()
//        let navigationController = UINavigationController(rootViewController: controller)
//         navigationController.navigationBar.tintColor = .white
//
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
//    }
    
    func startAdminApp() {
            let controller = AddReceptViewController()
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.navigationBar.tintColor = .white

            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }

        func startUserApp() {
            let controller = ContainerViewController()
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.navigationBar.tintColor = .white

            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }

          
    func startFirstScreen() {
        let controller = FirstScreenViewController()
        let navigationController = UINavigationController(rootViewController: controller)
         navigationController.navigationBar.tintColor = .white

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

