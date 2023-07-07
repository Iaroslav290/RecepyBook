//
//  MenuViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-06.
//

import UIKit


class ContainerViewController: UIViewController, ViewControllerDelegate {
   
    var controller: UIViewController!
    var menuViewController: UIViewController!
    var isMove = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
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
                self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
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
    
}
