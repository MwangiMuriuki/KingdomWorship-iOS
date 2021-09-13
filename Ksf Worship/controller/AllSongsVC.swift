//
//  ViewController.swift
//  Ksf Worship
//
//  Created by ERNEST MURIUKI on 10/09/2021.
//

import UIKit
import SideMenu

class AllSongsVC: UIViewController {

    var sideMenu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menu = SideMenuVC()
        menu.delegate = self
        
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.setNavigationBarHidden(false, animated: false)
        sideMenu?.navigationBar.backgroundColor = Colors.colorPrimaryDark
        sideMenu?.navigationBar.barTintColor = Colors.colorPrimaryDark
        sideMenu?.navigationBar.tintColor = Colors.colorPrimaryDark
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        //Uncomment this to make the Menu swipe from the left
        //SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }


    @IBAction func menuIconTapped(_ sender: Any) {
        
            present(sideMenu!, animated: true)
        
    }
}

extension AllSongsVC: SideMenuDelegate{
    func didSelectMenuItem(named: String) {
        
    }
    
    
}

