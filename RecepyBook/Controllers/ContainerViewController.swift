//
//  MenuViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-06.
//

import UIKit

var isMove = false
let button = UIButton(type: .custom)


class ContainerViewController: UIViewController, ViewControllerDelegate {
   
    var controller: UIViewController!
    var menuViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        
//        navigationItem.backButtonTitle = ""
//        navigationItem.backButtonDisplayMode = .minimal
        
        
        
        
        
        button.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        button.layer.cornerRadius = 45/2
        //    button.setImage(UIImage(named: "menu"), for: .normal)
        let buttonImage = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(toggleMenuWrapper), for: .touchUpInside)
        
        // Adjust the image size
        let scaledImageSize = CGSize(width: 25, height: 25)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: (45 - scaledImageSize.height) / 2, left: (45 - scaledImageSize.width) / 2, bottom: (45 - scaledImageSize.height) / 2, right: (45 - scaledImageSize.width) / 2)
        
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        let barButtonItem = UIBarButtonItem(customView: button)
        
        // Set the button as the left bar button item of the navigation bar
        navigationItem.rightBarButtonItem = barButtonItem
        
        
    }
    

    func configureViewController() {
        let viewController = HomePageViewController()
        controller = viewController
        
        viewController.delegate = self
        
        view.addSubview(controller.view)
        addChild(controller)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            print("Add menuViewController")
        }
    }
    
    func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            // show
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                self.controller.view.frame.origin.x = -152
            }) { (finished) in
                
            }
        } else {
            // hide
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                self.controller.view.frame.origin.x = 0
            }) { (finished) in
                
            }
        }
    }
    
    //MARK: ViewControllerDelegate
    
     func toggleMenu() {
        configureMenuViewController()
        isMove = !isMove
        showMenuViewController(shouldMove: isMove)
        
    }
    
    @objc func toggleMenuWrapper() {
           toggleMenu()
        print("HIIIII")
       }
    
   
}
