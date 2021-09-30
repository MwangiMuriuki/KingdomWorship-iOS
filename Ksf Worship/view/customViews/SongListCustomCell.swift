//
//  SongListCustomCell.swift
//  Ksf Worship
//
//  Created by ERNEST MURIUKI on 13/09/2021.
//

import UIKit

class SongListCustomCell: UICollectionViewCell {

   
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var songTitleLbl: UILabel!
    @IBOutlet weak var songArtistLbl: UILabel!
    @IBOutlet weak var playIcon: UIView!
    @IBOutlet weak var listenView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.layer.cornerRadius = 8
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = Colors.colorPrimaryDark.cgColor
        
        playIcon.layer.cornerRadius = 11.5
        
    }
    
    public func configure(with model: SongModelClass) {
        
        songTitleLbl.text = model.song_Title
        songArtistLbl.text = model.song_Lyrics
        
    }

}
