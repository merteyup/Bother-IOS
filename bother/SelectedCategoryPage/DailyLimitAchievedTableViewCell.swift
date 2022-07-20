//
//  DailyLimitAchievedTableViewCell.swift
//  bother
//
//  Created by Eyüp Mert on 15.07.2022.
//

import UIKit
import FirebaseAuth


class DailyLimitAchievedTableViewCell: UITableViewCell {
    


    
    // MARK: - Outlets
    @IBOutlet weak var imageAchievedLmt: UIImageView!
    @IBOutlet weak var headerAchievedLmt: UILabel!
    @IBOutlet weak var btnAchievedLimit: UIButton!

    // MARK: - Statements
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if Auth.auth().currentUser != nil {
            imageAchievedLmt.image = UIImage(systemName: "plus.message")
        } 
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
  
    
    
}
