//
//  SideMenuCustomCell.swift
//  Ksf Worship
//
//  Created by ERNEST MURIUKI on 13/09/2021.
//

import UIKit

class SideMenuCustomCell: UITableViewCell {
    @IBOutlet weak var menuLabel: UILabel!
   
    @IBOutlet weak var menuIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
