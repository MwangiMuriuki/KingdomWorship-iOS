//
//  AddSongVC.swift
//  Ksf Worship
//
//  Created by ERNEST MURIUKI on 13/09/2021.
//

import UIKit
import SideMenu

class AddSongVC: UIViewController {
    var sideMenu: SideMenuNavigationController?
    
    @IBOutlet weak var songTitle: UITextField!
    @IBOutlet weak var songArtist: UITextField!
    @IBOutlet weak var songLyrics: UITextView!
    @IBOutlet weak var audioFileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let menu = SideMenuVC()
        menu.delegate = self
        
        initViews()
        
        
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
    
    func initViews(){
        songTitle.layer.cornerRadius = 10
        songArtist.layer.cornerRadius = 10
        songLyrics.layer.cornerRadius = 10
        
        songTitle.layer.borderColor = Colors.colorSilver?.cgColor
        songArtist.layer.borderColor = Colors.colorSilver?.cgColor
        songLyrics.layer.borderColor = Colors.colorSilver?.cgColor
        
        songTitle.layer.borderWidth = 0.7
        songArtist.layer.borderWidth = 0.7
        songLyrics.layer.borderWidth = 0.7
    }
    
    @IBAction func menuIconTapped(_ sender: Any) {
            present(sideMenu!, animated: true)
    }
    
    @IBAction func selectSongTapped(_ sender: Any) {
    }
    
    @IBAction func clearAllTapped(_ sender: Any) {
    }
    
    @IBAction func addSongTapped(_ sender: Any) {
    }
    
    
}

extension AddSongVC: SideMenuDelegate{
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: {
            if named == "All Songs"{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AllSongsVC") as! AllSongsVC
                
                newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
            }
            
            else if named == "Add Song"{
                
//                let storyBoard: UIStoryboard = UIStoryboard(name: "AddSong", bundle: nil)
//                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddSongVC") as! AddSongVC
//                
//                newViewController.modalPresentationStyle = .fullScreen
//                self.present(newViewController, animated: true, completion: nil)
                
            }
            
            else if named == "My Favourites"{
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "FavouritesVC", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "FavouritesVC") as! FavouritesVC
                
                newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
                
            }
            
            else if named == "Tenzi za Rohoni"{
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "TenziVC") as! TenziVC
                
                newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
                
            }
            
            else if named == "My Profile"{
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Profile", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
                
                newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
                
            }
            
            else if named == "About App"{
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
                
                newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
                
            }
        })
    }
}
