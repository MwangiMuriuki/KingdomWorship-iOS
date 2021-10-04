//
//  RegisterVC.swift
//  Ksf Worship
//
//  Created by ERNEST MURIUKI on 04/10/2021.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var editProfileImg: UIImageView!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var formView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        formView.layer.cornerRadius = 20
        
        profileImage.layer.cornerRadius = 10
        editProfileImg.layer.cornerRadius = 14
        fullNameField.layer.cornerRadius = 10
        emailField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        
        fullNameField.layer.borderColor = Colors.colorSilver?.cgColor
        emailField.layer.borderColor = Colors.colorSilver?.cgColor
        passwordField.layer.borderColor = Colors.colorSilver?.cgColor
        editProfileImg.layer.borderColor = Colors.colorWhite?.cgColor

        
        fullNameField.layer.borderWidth = 0.7
        emailField.layer.borderWidth = 0.7
        passwordField.layer.borderWidth = 0.7
        editProfileImg.layer.borderWidth = 0.7
    }
    
    @IBAction func registerTapped(_ sender: Any) {
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
        
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
