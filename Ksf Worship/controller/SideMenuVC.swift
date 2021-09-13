//
//  SideMenuVC.swift
//  Ksf Worship
//
//  Created by ERNEST MURIUKI on 13/09/2021.
//

import UIKit

protocol SideMenuDelegate {
    func didSelectMenuItem(named: String)
}

class SideMenuVC: UIViewController {
    
    public var delegate: SideMenuDelegate?
    
    lazy var headerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = Colors.colorPrimary
        return v
    }()
        
    lazy var profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "splash_logo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var userNameView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = Colors.colorPrimary
        return v
    }()
    
    lazy var fullNameLabel: UILabel = {
        let al = UILabel()
        al.translatesAutoresizingMaskIntoConstraints = false
        al.text = "Ernest Mwangi"
        al.clipsToBounds = true
        al.font = UIFont(name: "AvenirNext-Medium", size: 15)
        al.textColor = .white
        al.textAlignment = .center
        return al
    }()
    
    lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.clipsToBounds = true
        tv.backgroundColor = Colors.layoutBackground
        tv.separatorStyle = .none
        tv.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        return tv
    }()
    
    lazy var footerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.backgroundColor = Colors.colorPrimaryDark
        return v
    }()
    

    
    lazy var logoutBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.backgroundColor = Colors.colorPrimaryDark
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    var menuItems = ["All Songs", "Add Song", "My Favourites", "Tenzi za Rohoni", "My Profile", "About App"]
    var menuIcons = [ UIImage.init(named: "dashboard_nav_icon"),
                      UIImage.init(named: "profile_outline"),
                      UIImage.init(named: "change_password_nav_icon"),
                      UIImage.init(named: "logout_nav_icon") ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.lightBlue
        addSubViews()
        setConstraints()
        initViews()
    }
    
    // MARK: - Initialize views
    
    func initViews(){
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // create attributed string
        let myString = "Logout"
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 15.0)! ]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute)
        
        //Add attributed string to button
        logoutBtn.setAttributedTitle(myAttrString, for: .normal)
        
    }
    
    // MARK: - Add Subviews
    
    func addSubViews(){
        view.addSubview(headerView)
        headerView.addSubview(profileImageView)
        headerView.addSubview(fullNameLabel)
        view.addSubview(tableView)
        view.addSubview(footerView)
        footerView.addSubview(logoutBtn)
    }
    
    
    // MARK: - Set Constraints
    
    func setConstraints(){
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor).isActive = true

        fullNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 5).isActive = true
        fullNameLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -5).isActive = true
         
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor, constant: 0).isActive = true
        
        footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        logoutBtn.heightAnchor.constraint(equalToConstant: 38).isActive = true
        logoutBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logoutBtn.centerXAnchor.constraint(equalTo: self.footerView.centerXAnchor).isActive = true
        logoutBtn.centerYAnchor.constraint(equalTo: self.footerView.centerYAnchor).isActive = true

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
