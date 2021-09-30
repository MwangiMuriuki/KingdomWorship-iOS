//
//  LoginVC.swift
//  Ksf Worship
//
//  Created by ERNEST MURIUKI on 29/09/2021.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        formView.layer.cornerRadius = 20
        
        emailField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        
        emailField.layer.borderColor = Colors.colorSilver?.cgColor
        passwordField.layer.borderColor = Colors.colorSilver?.cgColor
        
        emailField.layer.borderWidth = 0.7
        passwordField.layer.borderWidth = 0.7
        
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AllSongsVC") as! AllSongsVC
        
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func skipLoginTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AllSongsVC") as! AllSongsVC
        
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func registerTapped(_ sender: Any) {
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
