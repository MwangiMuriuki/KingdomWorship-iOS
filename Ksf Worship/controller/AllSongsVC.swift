//
//  ViewController.swift
//  Ksf Worship
//
//  Created by ERNEST MURIUKI on 10/09/2021.
//

import UIKit
import SideMenu
import FirebaseFirestore

class AllSongsVC: UIViewController {

    var sideMenu: SideMenuNavigationController?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainContentView: UIView!
    
    let firebaseDB = Firestore.firestore()
   
    
    let songs: [SongModelClass] = [
        SongModelClass(song_Title: "Song 1", song_Artist: "Artist 1", song_Lyrics: "Song Lyrics", time_Stamp: "xxxxxx", audio_Name: "xxxxxx", isFav: true),
        SongModelClass(song_Title: "Song 2", song_Artist: "Artist 2", song_Lyrics: "Song Lyrics", time_Stamp: "xxxxxx", audio_Name: "xxxxxx", isFav: false),
        SongModelClass(song_Title: "Song 3", song_Artist: "Artist 3", song_Lyrics: "Song Lyrics", time_Stamp: "xxxxxx", audio_Name: "xxxxxx", isFav: true),
        SongModelClass(song_Title: "Song 4", song_Artist: "Artist 4", song_Lyrics: "Song Lyrics", time_Stamp: "xxxxxx", audio_Name: "xxxxxx", isFav: false),
        SongModelClass(song_Title: "Song 5", song_Artist: "Artist 5", song_Lyrics: "Song Lyrics", time_Stamp: "xxxxxx", audio_Name: "xxxxxx", isFav: true),
        SongModelClass(song_Title: "Song 6", song_Artist: "Artist 6", song_Lyrics: "Song Lyrics", time_Stamp: "xxxxxx", audio_Name: "xxxxxx", isFav: true),
        SongModelClass(song_Title: "Song 7", song_Artist: "Artist 7", song_Lyrics: "Song Lyrics", time_Stamp: "xxxxxx", audio_Name: "xxxxxx", isFav: false)
    ]
    
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
        
        initViews()
        addData()
        fetchData()
       // fetchSongData()
        offlineModeSettings()
        
    }
    
    func initViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib.init(nibName: "SongListCustomCell", bundle: nil), forCellWithReuseIdentifier: "SongListCustomCell")
    }
    
    func addData(){
        let citiesRef = firebaseDB.collection("cities")
        
        citiesRef.document("SF").setData([
            "name": "San Francisco",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 860000,
            "regions": ["west_coast", "norcal"]
            ])
        citiesRef.document("LA").setData([
            "name": "Los Angeles",
            "state": "CA",
            "country": "USA",
            "capital": false,
            "population": 3900000,
            "regions": ["west_coast", "socal"]
            ])
        citiesRef.document("DC").setData([
            "name": "Washington D.C.",
            "country": "USA",
            "capital": true,
            "population": 680000,
            "regions": ["east_coast"]
            ])
        citiesRef.document("TOK").setData([
            "name": "Tokyo",
            "country": "Japan",
            "capital": true,
            "population": 9000000,
            "regions": ["kanto", "honshu"]
            ])
        citiesRef.document("BJ").setData([
            "name": "Beijing",
            "country": "China",
            "capital": true,
            "population": 21500000,
            "regions": ["jingjinji", "hebei"]
            ])
        
    }
    
    func fetchData(){
        let docRef = firebaseDB.collection("cities").document("SF")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func fetchSongData(){
        firebaseDB.collection("Kingdom Music").order(by: "song_Title", descending: false).getDocuments() { (querySnapshot, error) in
            if let err = error {
                print("DocError: \(err)")
            } else {
                if ((querySnapshot?.isEmpty) != nil){
                    print("Database is empty")
                }
                else{
                    for document in querySnapshot!.documents {
                        print("FSongs: \(document.documentID) => \(document.data())")
                    }
                }
            }
        }
        
    }
    
    func offlineModeSettings(){
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        firebaseDB.settings = settings
    }
    
    @IBAction func menuIconTapped(_ sender: Any) {
            present(sideMenu!, animated: true)
    }
}

extension AllSongsVC: SideMenuDelegate{
    func didSelectMenuItem(named: String) {
        sideMenu?.dismiss(animated: true, completion: {
            if named == "All Songs"{
//                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AllSongsVC") as! AllSongsVC
//
//                newViewController.modalPresentationStyle = .fullScreen
//                self.present(newViewController, animated: true, completion: nil)
            }
            
            else if named == "Add Song"{
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "AddSong", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddSongVC") as! AddSongVC
                
                newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: true, completion: nil)
                
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

extension AllSongsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SongListCustomCell", for: indexPath) as! SongListCustomCell
                cell.configure(with: songs[indexPath.row])
                return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (mainContentView.frame.size.width/2)-10, height: 110)
       // return CGSize(width:(mainContentView.frame.size.width/2)-11, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
}


