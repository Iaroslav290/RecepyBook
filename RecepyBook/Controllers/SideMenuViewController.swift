//
//  MenuViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-07-06.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemPink
        configerTableView()

    }
    

    func configerTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTableCell.self, forCellReuseIdentifier: MenuTableCell.reuseId)
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 90
        tableView.backgroundColor = .darkGray
    }
   
}


extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableCell.reuseId) as! MenuTableCell
        let menuModel = MenuModel(rawValue: indexPath.row)
        cell.iconImageView.image = menuModel?.image
        cell.myLabel.text = menuModel?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.item {
        case 0: print("Profile")
        case 1: print("Wishlist")
        case 2: print("Menu")
            let menu = MenuSelectCategoryViewController()
            if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                navigationController.pushViewController(menu, animated: true)
            }
        case 3: print("Contacts")
        case 4: print("Settings")
            let setting = SettingsViewController()
                    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                        navigationController.pushViewController(setting, animated: true)
                    }
        default: break
        }
        
    }
    
    
}

