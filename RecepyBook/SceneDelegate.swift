//
//  SceneDelegate.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var containerViewController: ContainerViewController?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
               self.window = window

               let controller = ContainerViewController()
               let navigationController = UINavigationController(rootViewController: controller)

               // Customize the navigation bar appearance
               let navigationBarAppearance = UINavigationBar.appearance()
               navigationBarAppearance.tintColor = .white
               navigationBarAppearance.barTintColor = .blue

               // Create a UIBarButtonItem
                let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        button.layer.cornerRadius = 45/2
    //    button.setImage(UIImage(named: "menu"), for: .normal)
        let buttonImage = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
            button.setImage(buttonImage, for: .normal)
        button.addTarget(nil, action: #selector(containerViewController?.toggleMenuWrapper), for: .touchUpInside)
            
            // Adjust the image size
            let scaledImageSize = CGSize(width: 25, height: 25)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = UIEdgeInsets(top: (45 - scaledImageSize.height) / 2, left: (45 - scaledImageSize.width) / 2, bottom: (45 - scaledImageSize.height) / 2, right: (45 - scaledImageSize.width) / 2)
            
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        

                // Create a UIBarButtonItem with the custom button
                let customButton = UIBarButtonItem(customView: button)
                controller.navigationItem.rightBarButtonItem = customButton

               // Add the button to the navigation bar

               window.rootViewController = navigationController
               window.makeKeyAndVisible()
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

